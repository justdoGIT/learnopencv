#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

usage() {
  cat <<'USAGE'
Usage:
  configure-opencv5.sh desktop-cpu --source PATH --contrib PATH --build PATH \
    --prefix PATH --python PATH --version 5.0.0 [--run]

  configure-opencv5.sh headless-cuda --source PATH --contrib PATH --build PATH \
    --prefix PATH --python PATH --cuda-root PATH --cuda-arch-cmake N \
    --cuda-arch-opencv N.N --dnn-cuda on|off --version 5.0.0 [--run]

Without --run, the helper validates inputs and prints the CMake command.
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

require_cmake_318() {
  local version_line version major minor
  IFS= read -r version_line < <(cmake --version)
  version=${version_line#cmake version }
  if [[ "$version" =~ ^([0-9]+)[.]([0-9]+) ]]; then
    major=${BASH_REMATCH[1]}
    minor=${BASH_REMATCH[2]}
  else
    die "could not parse CMake version: $version_line"
  fi
  if (( major < 3 || (major == 3 && minor < 18) )); then
    die "headless-cuda requires CMake 3.18 or newer, found $version"
  fi
}

if (( $# == 0 )); then
  usage
  exit 2
fi

PROFILE=$1
shift
case "$PROFILE" in
  desktop-cpu|headless-cuda) ;;
  -h|--help)
    usage
    exit 0
    ;;
  *) die "profile must be desktop-cpu or headless-cuda, not $PROFILE" ;;
esac

SOURCE=
CONTRIB=
BUILD=
PREFIX=
PYTHON=
CUDA_ROOT=
CUDA_ARCH_CMAKE=
CUDA_ARCH_OPENCV=
DNN_CUDA=
VERSION=
RUN=0

while (( $# > 0 )); do
  case "$1" in
    --source|--contrib|--build|--prefix|--python|--cuda-root|--cuda-arch-cmake|--cuda-arch-opencv|--dnn-cuda|--version)
      (( $# >= 2 )) || die "missing value for $1"
      option=$1
      value=$2
      shift 2
      case "$option" in
        --source) SOURCE=$value ;;
        --contrib) CONTRIB=$value ;;
        --build) BUILD=$value ;;
        --prefix) PREFIX=$value ;;
        --python) PYTHON=$value ;;
        --cuda-root) CUDA_ROOT=$value ;;
        --cuda-arch-cmake) CUDA_ARCH_CMAKE=$value ;;
        --cuda-arch-opencv) CUDA_ARCH_OPENCV=$value ;;
        --dnn-cuda) DNN_CUDA=$value ;;
        --version) VERSION=$value ;;
      esac
      ;;
    --run)
      RUN=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *) die "unknown argument: $1" ;;
  esac
done

for variable in SOURCE CONTRIB BUILD PREFIX PYTHON VERSION; do
  [[ -n "${!variable}" ]] || die "--${variable,,} is required"
done
[[ "$VERSION" == 5.0.0 ]] || die "this release configures OpenCV 5.0.0, not $VERSION"

require_absolute "--source" "$SOURCE"
require_absolute "--contrib" "$CONTRIB"
require_absolute "--build" "$BUILD"
require_absolute "--prefix" "$PREFIX"
require_absolute "--python" "$PYTHON"

[[ -f "$SOURCE/CMakeLists.txt" ]] || die "OpenCV CMakeLists.txt not found: $SOURCE"
[[ -d "$SOURCE/.git" ]] || die "OpenCV source is not a Git checkout: $SOURCE"
[[ -d "$CONTRIB/modules" ]] || die "opencv_contrib modules directory not found: $CONTRIB/modules"
[[ -d "$CONTRIB/.git" ]] || die "opencv_contrib source is not a Git checkout: $CONTRIB"
[[ -x "$PYTHON" ]] || die "Python executable is missing or not executable: $PYTHON"
"$PYTHON" -c 'import numpy' >/dev/null 2>&1 || die "the selected Python cannot import NumPy"
command -v git >/dev/null 2>&1 || die "git is required to verify source commits"
command -v cmake >/dev/null 2>&1 || die "cmake is required"
command -v ninja >/dev/null 2>&1 || die "ninja is required"
command -v realpath >/dev/null 2>&1 || die "realpath is required"

[[ ! -L "$BUILD" ]] || die "build path must not be a symlink: $BUILD"
[[ ! -e "$BUILD" ]] || die "build path must not already exist: $BUILD"
[[ ! -L "$PREFIX" ]] || die "install prefix must not be a symlink: $PREFIX"
[[ ! -e "$PREFIX" ]] || die "install prefix must not already exist: $PREFIX"

case "$PREFIX" in
  /|/usr|/usr/|/usr/local|/usr/local/) die "unsafe install prefix: $PREFIX" ;;
esac
PREFIX_RESOLVED=$(realpath -m -- "$PREFIX")
case "$PREFIX_RESOLVED" in
  /|/usr|/usr/local) die "unsafe resolved install prefix: $PREFIX_RESOLVED" ;;
esac
if [[ "$PREFIX_RESOLVED" == "$HOME" ]]; then
  die "the install prefix must not be the home directory"
fi

OPENCV_EXPECTED_COMMIT=40738fb16ceddb5fb3fea747585f7ce6abb0605b
CONTRIB_EXPECTED_COMMIT=755e50675d97db9b7d449d8bd6b09888646f6c6e
OPENCV_COMMIT=$(git -C "$SOURCE" rev-parse HEAD)
CONTRIB_COMMIT=$(git -C "$CONTRIB" rev-parse HEAD)
[[ "$OPENCV_COMMIT" == "$OPENCV_EXPECTED_COMMIT" ]] || die "unexpected OpenCV commit: $OPENCV_COMMIT"
[[ "$CONTRIB_COMMIT" == "$CONTRIB_EXPECTED_COMMIT" ]] || die "unexpected opencv_contrib commit: $CONTRIB_COMMIT"
if ! SOURCE_STATUS=$(git -C "$SOURCE" status --porcelain --untracked-files=normal); then
  die "could not inspect OpenCV source status: $SOURCE"
fi
if ! CONTRIB_STATUS=$(git -C "$CONTRIB" status --porcelain --untracked-files=normal); then
  die "could not inspect opencv_contrib source status: $CONTRIB"
fi
[[ -z "$SOURCE_STATUS" ]] || die "OpenCV source checkout is not clean: $SOURCE"
[[ -z "$CONTRIB_STATUS" ]] || die "opencv_contrib checkout is not clean: $CONTRIB"

PYTHON_VERSION=$(
  "$PYTHON" -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")'
)
PYTHON_PACKAGES="$PREFIX/lib/python${PYTHON_VERSION}/site-packages"

CMAKE_ARGS=(
  cmake
  -S "$SOURCE"
  -B "$BUILD"
  -G Ninja
  -DCMAKE_BUILD_TYPE=Release
  -DCMAKE_CXX_STANDARD=17
  "-DCMAKE_INSTALL_PREFIX=$PREFIX"
  "-DCMAKE_INSTALL_RPATH=$PREFIX/lib"
  "-DOPENCV_EXTRA_MODULES_PATH=$CONTRIB/modules"
  -DOPENCV_GENERATE_PKGCONFIG=ON
  -DENABLE_CONFIG_VERIFICATION=ON
  -DBUILD_TESTS=OFF
  -DBUILD_PERF_TESTS=OFF
  -DBUILD_EXAMPLES=OFF
  -DBUILD_JAVA=OFF
  -DBUILD_opencv_python3=ON
  "-DPYTHON3_EXECUTABLE=$PYTHON"
  "-DPYTHON3_PACKAGES_PATH=$PYTHON_PACKAGES"
  -DBUILD_opencv_cudacodec=OFF
  -DWITH_1394=OFF
  -DWITH_AVIF=OFF
  -DWITH_VTK=OFF
  -DWITH_NVCUVID=OFF
  -DWITH_NVCUVENC=OFF
  -DWITH_JASPER=OFF
  -DWITH_OPENEXR=OFF
  -DWITH_OPENCLAMDFFT=OFF
  -DWITH_OPENCLAMDBLAS=OFF
  -DWITH_VA=OFF
  -DWITH_VA_INTEL=OFF
  -DWITH_TESSERACT=OFF
)

if [[ "$PROFILE" == desktop-cpu ]]; then
  [[ -z "$CUDA_ROOT" && -z "$CUDA_ARCH_CMAKE" && -z "$CUDA_ARCH_OPENCV" && -z "$DNN_CUDA" ]] || \
    die "desktop-cpu does not accept CUDA arguments"
  CMAKE_ARGS+=(
    -DWITH_CUDA=OFF
    -DWITH_GTK=ON
    -DWITH_GTK_2_X=OFF
    -DWITH_QT=OFF
    -DWITH_WAYLAND=OFF
    -DWITH_OPENGL=OFF
    -DWITH_FFMPEG=ON
    -DWITH_GSTREAMER=ON
    -DWITH_V4L=ON
    -DWITH_TBB=ON
    -DWITH_EIGEN=ON
    -DWITH_LAPACK=ON
    -DWITH_JPEG=ON
    -DWITH_PNG=ON
    -DWITH_TIFF=ON
    -DWITH_WEBP=ON
    -DWITH_OPENJPEG=ON
    -DBUILD_JPEG=OFF
    -DBUILD_PNG=OFF
    -DBUILD_TIFF=OFF
    -DBUILD_WEBP=OFF
    -DBUILD_OPENJPEG=OFF
    -DBUILD_TBB=OFF
    -DBUILD_CLAPACK=OFF
  )
else
  require_cmake_318
  [[ -n "$CUDA_ROOT" ]] || die "headless-cuda requires --cuda-root"
  [[ -n "$CUDA_ARCH_CMAKE" ]] || die "headless-cuda requires --cuda-arch-cmake"
  [[ -n "$CUDA_ARCH_OPENCV" ]] || die "headless-cuda requires --cuda-arch-opencv"
  case "$DNN_CUDA" in on|off) ;; *) die "--dnn-cuda must be on or off" ;; esac
  require_absolute "--cuda-root" "$CUDA_ROOT"
  [[ -x "$CUDA_ROOT/bin/nvcc" ]] || die "nvcc not found under --cuda-root: $CUDA_ROOT"
  [[ "$CUDA_ARCH_CMAKE" =~ ^[0-9]+$ ]] || \
    die "--cuda-arch-cmake must be one dotless capability such as 61 or 100"
  [[ "$CUDA_ARCH_OPENCV" =~ ^[0-9]+[.][0-9]+$ ]] || \
    die "invalid --cuda-arch-opencv value"
  [[ "${CUDA_ARCH_OPENCV/./}" == "$CUDA_ARCH_CMAKE" ]] || \
    die "CUDA architecture values disagree: $CUDA_ARCH_CMAKE versus $CUDA_ARCH_OPENCV"

  WITH_CUDNN=OFF
  OPENCV_DNN_CUDA=OFF
  if [[ "$DNN_CUDA" == on ]]; then
    WITH_CUDNN=ON
    OPENCV_DNN_CUDA=ON
  fi

  CMAKE_ARGS+=(
    "-DCMAKE_CUDA_COMPILER=$CUDA_ROOT/bin/nvcc"
    "-DCUDAToolkit_ROOT=$CUDA_ROOT"
    -DWITH_CUDA=ON
    -DENABLE_CUDA_FIRST_CLASS_LANGUAGE=ON
    "-DCMAKE_CUDA_ARCHITECTURES=$CUDA_ARCH_CMAKE"
    "-DCUDA_ARCH_BIN=$CUDA_ARCH_OPENCV"
    -DWITH_CUBLAS=ON
    "-DWITH_CUDNN=$WITH_CUDNN"
    "-DOPENCV_DNN_CUDA=$OPENCV_DNN_CUDA"
    -DWITH_GTK=OFF
    -DWITH_FFMPEG=OFF
    -DWITH_GSTREAMER=OFF
    -DWITH_TBB=OFF
    -DWITH_EIGEN=OFF
    -DWITH_LAPACK=ON
    -DBUILD_CLAPACK=ON
  )
fi

printf 'Validated OpenCV %s profile: %s\n' "$VERSION" "$PROFILE"
printf 'CMake command:'
printf ' %q' "${CMAKE_ARGS[@]}"
printf '\n'

if (( RUN == 0 )); then
  printf 'Dry run only. Re-run with --run to configure.\n'
  exit 0
fi

"${CMAKE_ARGS[@]}"

CMAKE_CACHE="$BUILD/CMakeCache.txt"
[[ -f "$CMAKE_CACHE" ]] || die "CMake did not create CMakeCache.txt"
grep -Fqx "PYTHON3_EXECUTABLE:FILEPATH=$PYTHON" "$CMAKE_CACHE" || \
  die "CMake did not retain the selected Python executable"
grep -Fqx "PYTHON3_PACKAGES_PATH:STRING=$PYTHON_PACKAGES" "$CMAKE_CACHE" || \
  die "CMake did not retain the selected Python install path"

PYTHON_LIBRARY=$(sed -n 's/^PYTHON3_LIBRARY:[^=]*=//p' "$CMAKE_CACHE")
[[ -n "$PYTHON_LIBRARY" && "$PYTHON_LIBRARY" != *NOTFOUND* && -f "$PYTHON_LIBRARY" ]] || \
  die "CMake did not find the matching Python development library"

NUMPY_INCLUDE=$(sed -n 's/^PYTHON3_NUMPY_INCLUDE_DIRS:[^=]*=//p' "$CMAKE_CACHE")
[[ -n "$NUMPY_INCLUDE" && "$NUMPY_INCLUDE" != *NOTFOUND* && -d "$NUMPY_INCLUDE" ]] || \
  die "CMake did not find the selected environment's NumPy headers"

CMAKE_TARGETS="$BUILD/companion-targets.txt"
cmake --build "$BUILD" --target help > "$CMAKE_TARGETS"
grep -Eq '^opencv_python3:' "$CMAKE_TARGETS" || \
  die "CMake completed without generating the opencv_python3 target"

printf 'Configuration complete. Build and install remain separate explicit steps.\n'
