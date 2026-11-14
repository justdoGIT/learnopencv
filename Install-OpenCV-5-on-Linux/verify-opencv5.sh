#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

usage() {
  cat <<'USAGE'
Usage:
  verify-opencv5.sh wheel --python PATH --variant NAME --version VERSION --evidence PATH
  verify-opencv5.sh source --profile desktop-cpu --prefix PATH --python PATH \
    --version VERSION --evidence PATH [--source PATH --contrib PATH]
  verify-opencv5.sh source --profile headless-cuda --prefix PATH --python PATH \
    --cuda-root PATH --dnn-cuda on|off --version VERSION --evidence PATH \
    [--source PATH --contrib PATH]

The evidence path must be absolute and must not already exist.
USAGE
}

die() {
  printf 'ERROR: %s\n' "$*" >&2
  exit 2
}

require_absolute() {
  local label=$1
  local value=$2
  case "$value" in
    /*) ;;
    *) die "$label must be an absolute path: $value" ;;
  esac
}

require_command() {
  command -v "$1" >/dev/null 2>&1 || die "required command not found: $1"
}

if (( $# == 0 )); then
  usage
  exit 2
fi

MODE=$1
shift
case "$MODE" in
  wheel|source) ;;
  -h|--help)
    usage
    exit 0
    ;;
  *) die "mode must be wheel or source, not $MODE" ;;
esac

PYTHON=
VARIANT=
PROFILE=
PREFIX=
CUDA_ROOT=
DNN_CUDA=
VERSION=
EVIDENCE=
SOURCE=
CONTRIB=
OPENCV_NVIDIA_SMI=

while (( $# > 0 )); do
  case "$1" in
    --python|--variant|--profile|--prefix|--cuda-root|--dnn-cuda|--version|--evidence|--source|--contrib)
      (( $# >= 2 )) || die "missing value for $1"
      option=$1
      value=$2
      shift 2
      case "$option" in
        --python) PYTHON=$value ;;
        --variant) VARIANT=$value ;;
        --profile) PROFILE=$value ;;
        --prefix) PREFIX=$value ;;
        --cuda-root) CUDA_ROOT=$value ;;
        --dnn-cuda) DNN_CUDA=$value ;;
        --version) VERSION=$value ;;
        --evidence) EVIDENCE=$value ;;
        --source) SOURCE=$value ;;
        --contrib) CONTRIB=$value ;;
      esac
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *) die "unknown argument: $1" ;;
  esac
done

[[ -n "$PYTHON" ]] || die "--python is required"
[[ -n "$VERSION" ]] || die "--version is required"
[[ "$VERSION" == 5.0.0 ]] || die "this release verifies OpenCV 5.0.0, not $VERSION"
[[ -n "$EVIDENCE" ]] || die "--evidence is required"
require_command realpath
require_absolute "--python" "$PYTHON"
require_absolute "--evidence" "$EVIDENCE"
[[ -x "$PYTHON" ]] || die "Python executable is missing or not executable: $PYTHON"
[[ ! -L "$EVIDENCE" ]] || die "evidence path must not be a symlink: $EVIDENCE"
[[ ! -e "$EVIDENCE" ]] || die "evidence path already exists: $EVIDENCE"
[[ -d "$(dirname -- "$EVIDENCE")" ]] || die "evidence parent directory does not exist: $(dirname -- "$EVIDENCE")"

if [[ -n "$SOURCE" || -n "$CONTRIB" ]]; then
  [[ -n "$SOURCE" && -n "$CONTRIB" ]] || die "--source and --contrib must be supplied together"
  require_absolute "--source" "$SOURCE"
  require_absolute "--contrib" "$CONTRIB"
  [[ -d "$SOURCE/.git" ]] || die "OpenCV source is not a Git checkout: $SOURCE"
  [[ -d "$CONTRIB/.git" ]] || die "opencv_contrib source is not a Git checkout: $CONTRIB"
  require_command git
  if ! SOURCE_STATUS=$(git -C "$SOURCE" status --porcelain --untracked-files=normal); then
    die "could not inspect OpenCV source status: $SOURCE"
  fi
  if ! CONTRIB_STATUS=$(git -C "$CONTRIB" status --porcelain --untracked-files=normal); then
    die "could not inspect opencv_contrib source status: $CONTRIB"
  fi
  [[ -z "$SOURCE_STATUS" ]] || die "OpenCV source checkout is not clean: $SOURCE"
  [[ -z "$CONTRIB_STATUS" ]] || die "opencv_contrib checkout is not clean: $CONTRIB"
fi

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
PYTHON_CHECK="$SCRIPT_DIR/verify_python.py"
CPP_SOURCE="$SCRIPT_DIR/cpp-smoke"
[[ -f "$PYTHON_CHECK" ]] || die "missing companion file: $PYTHON_CHECK"
[[ -f "$CPP_SOURCE/CMakeLists.txt" ]] || die "missing companion C++ project: $CPP_SOURCE"

PYTHON_ARGS=(
  --mode "$MODE"
  --version "$VERSION"
  --build-info-output "$EVIDENCE/opencv-build-information.txt"
)

if [[ "$MODE" == wheel ]]; then
  case "$VARIANT" in
    opencv-python|opencv-contrib-python|opencv-python-headless|opencv-contrib-python-headless) ;;
    *) die "--variant must name one official OpenCV wheel family" ;;
  esac
  [[ -z "$PROFILE" && -z "$PREFIX" && -z "$CUDA_ROOT" && -z "$DNN_CUDA" ]] || \
    die "wheel mode does not accept source-profile arguments"
  [[ -z "$SOURCE" && -z "$CONTRIB" ]] || \
    die "wheel mode does not accept --source or --contrib"
  PYTHON_ARGS+=(--variant "$VARIANT")
  WHEEL_GUI_RUNTIME=0
  if [[ "$VARIANT" != *-headless ]]; then
    WHEEL_GUI_RUNTIME=1
    if [[ -z "${DISPLAY:-}" ]]; then
      require_command xvfb-run
    fi
  fi
else
  case "$PROFILE" in
    desktop-cpu|headless-cuda) ;;
    *) die "--profile must be desktop-cpu or headless-cuda" ;;
  esac
  [[ -z "$VARIANT" ]] || die "source mode does not accept --variant"
  [[ -n "$PREFIX" ]] || die "source mode requires --prefix"
  require_absolute "--prefix" "$PREFIX"
  [[ -d "$PREFIX" ]] || die "OpenCV prefix does not exist: $PREFIX"
  PREFIX_REAL=$(realpath -e -- "$PREFIX")
  PYTHON_ARGS+=(--profile "$PROFILE" --prefix "$PREFIX_REAL")

  require_command cmake
  require_command pkg-config
  require_command ldd
  CXX_COMMAND=${CXX:-c++}
  command -v "$CXX_COMMAND" >/dev/null 2>&1 || die "C++ compiler not found: $CXX_COMMAND"
  if [[ "$PROFILE" == desktop-cpu ]]; then
    [[ -z "$CUDA_ROOT" && -z "$DNN_CUDA" ]] || \
      die "desktop-cpu does not accept --cuda-root or --dnn-cuda"
    require_command xvfb-run
  else
    [[ -n "$CUDA_ROOT" ]] || die "headless-cuda requires --cuda-root"
    require_absolute "--cuda-root" "$CUDA_ROOT"
    [[ -x "$CUDA_ROOT/bin/nvcc" ]] || die "nvcc not found under --cuda-root: $CUDA_ROOT"
    case "$DNN_CUDA" in on|off) ;; *) die "headless-cuda requires --dnn-cuda on or off" ;; esac
    PYTHON_ARGS+=(--dnn-cuda "$DNN_CUDA")
    if command -v nvidia-smi >/dev/null 2>&1; then
      OPENCV_NVIDIA_SMI=$(command -v nvidia-smi)
    elif [[ -x /usr/lib/wsl/lib/nvidia-smi ]]; then
      OPENCV_NVIDIA_SMI=/usr/lib/wsl/lib/nvidia-smi
    else
      die "nvidia-smi is required on PATH or at /usr/lib/wsl/lib/nvidia-smi"
    fi
  fi
fi

if [[ -n "$SOURCE" ]]; then
  OPENCV_EXPECTED_COMMIT=40738fb16ceddb5fb3fea747585f7ce6abb0605b
  CONTRIB_EXPECTED_COMMIT=755e50675d97db9b7d449d8bd6b09888646f6c6e
  OPENCV_COMMIT=$(git -C "$SOURCE" rev-parse HEAD)
  CONTRIB_COMMIT=$(git -C "$CONTRIB" rev-parse HEAD)
  [[ "$OPENCV_COMMIT" == "$OPENCV_EXPECTED_COMMIT" ]] || die "unexpected OpenCV commit: $OPENCV_COMMIT"
  [[ "$CONTRIB_COMMIT" == "$CONTRIB_EXPECTED_COMMIT" ]] || die "unexpected opencv_contrib commit: $CONTRIB_COMMIT"
fi

mkdir -- "$EVIDENCE"

{
  printf 'verification_utc='
  date -u '+%Y-%m-%dT%H:%M:%SZ'
  printf 'mode=%s\n' "$MODE"
  printf 'version=%s\n' "$VERSION"
  printf 'variant=%s\n' "${VARIANT:-none}"
  printf 'profile=%s\n' "${PROFILE:-none}"
  printf 'prefix=%s\n' "${PREFIX_REAL:-none}"
  printf 'dnn_cuda=%s\n' "${DNN_CUDA:-not-applicable}"
  printf 'nvidia_smi=%s\n' "${OPENCV_NVIDIA_SMI:-not-applicable}"
  printf 'machine=%s\n' "$(uname -m)"
  printf 'kernel=%s\n' "$(uname -sr)"
  printf 'python=%s\n' "$(realpath -e -- "$PYTHON")"
  if [[ -r /etc/os-release ]]; then
    sed -n 's/^\(ID\|VERSION_ID\|PRETTY_NAME\)=/os_\1=/p' /etc/os-release
  fi
} > "$EVIDENCE/host.txt"

"$PYTHON" --version > "$EVIDENCE/python-version.txt" 2>&1

if [[ -n "$SOURCE" ]]; then
  {
    printf 'opencv=%s\n' "$OPENCV_COMMIT"
    printf 'opencv_contrib=%s\n' "$CONTRIB_COMMIT"
  } > "$EVIDENCE/source-commits.txt"
fi

if [[ "$MODE" == wheel ]]; then
  if (( WHEEL_GUI_RUNTIME == 1 )) && [[ -z "${DISPLAY:-}" ]]; then
    xvfb-run -a "$PYTHON" "$PYTHON_CHECK" "${PYTHON_ARGS[@]}" \
      2>&1 | tee "$EVIDENCE/python-runtime.txt"
  else
    "$PYTHON" "$PYTHON_CHECK" "${PYTHON_ARGS[@]}" \
      2>&1 | tee "$EVIDENCE/python-runtime.txt"
  fi
  printf 'Verification evidence: %s\n' "$EVIDENCE"
  exit 0
fi

if [[ "$PROFILE" == desktop-cpu ]]; then
  xvfb-run -a "$PYTHON" "$PYTHON_CHECK" "${PYTHON_ARGS[@]}" \
    2>&1 | tee "$EVIDENCE/python-runtime.txt"
else
  "$PYTHON" "$PYTHON_CHECK" "${PYTHON_ARGS[@]}" \
    2>&1 | tee "$EVIDENCE/python-runtime.txt"
  "$CUDA_ROOT/bin/nvcc" --version > "$EVIDENCE/nvcc.txt" 2>&1
  if ! "$OPENCV_NVIDIA_SMI" --query-gpu=index,name,driver_version,compute_cap \
      --format=csv,noheader > "$EVIDENCE/nvidia-gpus.csv"; then
    die "nvidia-smi inventory query failed; WSL's limited interface may require manual verification"
  fi
  if [[ -r /proc/driver/nvidia/version ]]; then
    sed -n '1,3p' /proc/driver/nvidia/version > "$EVIDENCE/nvidia-kernel-driver.txt"
  fi
fi

OPENCV_DIR=
PKGCONFIG_DIR=
for candidate in \
  "$PREFIX_REAL/lib/cmake/opencv5" \
  "$PREFIX_REAL/lib64/cmake/opencv5"; do
  if [[ -f "$candidate/OpenCVConfig.cmake" ]]; then
    OPENCV_DIR=$candidate
    break
  fi
done
[[ -n "$OPENCV_DIR" ]] || die "OpenCVConfig.cmake not found under $PREFIX_REAL/lib or lib64"

for candidate in \
  "$PREFIX_REAL/lib/pkgconfig" \
  "$PREFIX_REAL/lib64/pkgconfig"; do
  if [[ -f "$candidate/opencv5.pc" ]]; then
    PKGCONFIG_DIR=$candidate
    break
  fi
done
[[ -n "$PKGCONFIG_DIR" ]] || die "opencv5.pc not found under $PREFIX_REAL/lib or lib64"

CPP_BUILD="$EVIDENCE/cpp-build"
CMAKE_EXPECT_CUDA=OFF
if [[ "$PROFILE" == headless-cuda ]]; then
  CMAKE_EXPECT_CUDA=ON
fi
CMAKE_ARGS=(
  -S "$CPP_SOURCE"
  -B "$CPP_BUILD"
  "-DOpenCV_DIR=$OPENCV_DIR"
  "-DOPENCV5_EXPECT_CUDA=$CMAKE_EXPECT_CUDA"
)
if [[ "$PROFILE" == headless-cuda ]]; then
  CMAKE_ARGS+=(
    "-DCUDAToolkit_ROOT=$CUDA_ROOT"
  )
fi

cmake "${CMAKE_ARGS[@]}" 2>&1 | tee "$EVIDENCE/cpp-configure.txt"
cmake --build "$CPP_BUILD" --parallel 2 2>&1 | tee "$EVIDENCE/cpp-build.txt"
"$CPP_BUILD/opencv5_companion_smoke" 2>&1 | tee "$EVIDENCE/cpp-runtime.txt"

ldd "$CPP_BUILD/opencv5_companion_smoke" > "$EVIDENCE/ldd.txt"
awk -v prefix="$PREFIX_REAL/" '
  /libopencv/ {
    seen = 1
    if ($0 ~ /not found/ || index($0, prefix) == 0)
      bad = 1
  }
  END { exit (!seen || bad) }
' "$EVIDENCE/ldd.txt" || die "an OpenCV library is missing or resolves outside $PREFIX_REAL"

PKG_CONFIG_PATH="$PKGCONFIG_DIR" pkg-config --modversion opencv5 \
  > "$EVIDENCE/pkg-config-version.txt"
[[ "$(sed -n '1p' "$EVIDENCE/pkg-config-version.txt")" == "$VERSION" ]] || \
  die "pkg-config did not report $VERSION"

cmake --version > "$EVIDENCE/cmake-version.txt"
"$CXX_COMMAND" --version > "$EVIDENCE/cxx-version.txt" 2>&1

printf 'OpenCV source profile verification: PASS\n'
printf 'Verification evidence: %s\n' "$EVIDENCE"
