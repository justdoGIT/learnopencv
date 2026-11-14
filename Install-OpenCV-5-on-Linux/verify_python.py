#!/usr/bin/env python3
"""Strict runtime checks for the OpenCV 5 Linux companion bundle."""

from __future__ import annotations

import argparse
from importlib import metadata
from pathlib import Path
import re
import sys
import tempfile

import cv2
import numpy as np


WHEEL_PACKAGES = {
    "opencv-python",
    "opencv-contrib-python",
    "opencv-python-headless",
    "opencv-contrib-python-headless",
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--mode", choices=("wheel", "source"), required=True)
    parser.add_argument("--version", required=True)
    parser.add_argument("--variant", choices=sorted(WHEEL_PACKAGES))
    parser.add_argument("--profile", choices=("desktop-cpu", "headless-cuda"))
    parser.add_argument("--prefix", type=Path)
    parser.add_argument("--dnn-cuda", choices=("on", "off"))
    parser.add_argument("--build-info-output", type=Path, required=True)
    return parser.parse_args()


def normalized_distribution_names() -> set[str]:
    return {
        distribution.metadata["Name"].lower().replace("_", "-")
        for distribution in metadata.distributions()
        if distribution.metadata.get("Name")
    }


def summary_value(build_information: str, label: str) -> str:
    match = re.search(rf"^\s*{re.escape(label)}:\s*(.+)$", build_information, re.MULTILINE)
    return match.group(1).strip() if match else "MISSING"


def disabled_or_omitted(value: str) -> bool:
    """OpenCV may omit a disabled backend row from its build summary."""
    return value == "MISSING" or value.startswith("NO")


class VerificationError(RuntimeError):
    """A selected installation does not satisfy its declared contract."""


def require(condition: bool, message: str) -> None:
    if not condition:
        raise VerificationError(message)


def test_image_core() -> None:
    image = np.zeros((192, 256, 3), dtype=np.uint8)
    cv2.rectangle(image, (24, 24), (232, 168), (0, 180, 255), thickness=-1)
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    ok, encoded = cv2.imencode(".png", gray)
    require(ok, "PNG encoding failed")
    decoded = cv2.imdecode(encoded, cv2.IMREAD_GRAYSCALE)
    require(decoded is not None, "PNG decoding returned no image")
    require(np.array_equal(decoded, gray), "PNG round trip changed the image")
    print("Image processing and in-memory PNG I/O: PASS")


def test_gui_runtime(expected_backend: str | None = None) -> None:
    image = np.zeros((48, 64, 3), dtype=np.uint8)
    try:
        cv2.namedWindow("opencv5-companion-gui")
        cv2.imshow("opencv5-companion-gui", image)
        cv2.waitKey(1)
        backend = cv2.currentUIFramework()
        require(bool(backend) and backend != "NONE", "HighGUI did not select a GUI backend")
        if expected_backend is not None:
            require(backend == expected_backend, f"HighGUI selected {backend}, not {expected_backend}")
    finally:
        cv2.destroyAllWindows()
    print(f"HighGUI {backend} window operation: PASS")


def test_desktop_backends() -> None:
    build_information = cv2.getBuildInformation()
    require(
        summary_value(build_information, "GUI").startswith("GTK3"),
        "desktop-cpu requires the GTK3 GUI backend",
    )
    require(
        summary_value(build_information, "FFMPEG").startswith("YES"),
        "desktop-cpu requires FFmpeg",
    )
    require(
        summary_value(build_information, "GStreamer").startswith("YES"),
        "desktop-cpu requires GStreamer",
    )

    frame = np.zeros((48, 64, 3), dtype=np.uint8)
    frame[:, :, 1] = 173
    with tempfile.TemporaryDirectory() as directory:
        video_path = Path(directory) / "ffmpeg-smoke.avi"
        writer = cv2.VideoWriter(
            str(video_path),
            cv2.CAP_FFMPEG,
            cv2.VideoWriter_fourcc(*"MJPG"),
            5.0,
            (64, 48),
        )
        require(writer.isOpened(), "FFmpeg VideoWriter did not open")
        require(writer.getBackendName() == "FFMPEG", "VideoWriter selected the wrong backend")
        writer.write(frame)
        writer.release()

        capture = cv2.VideoCapture(str(video_path), cv2.CAP_FFMPEG)
        require(capture.isOpened(), "FFmpeg VideoCapture did not open")
        require(capture.getBackendName() == "FFMPEG", "VideoCapture selected the wrong backend")
        ok, decoded = capture.read()
        capture.release()
        require(ok and decoded is not None, "FFmpeg could not decode the generated frame")
        require(decoded.shape == frame.shape, "FFmpeg decoded an unexpected frame shape")

    pipeline = (
        "videotestsrc num-buffers=1 ! videoconvert ! "
        "video/x-raw,format=BGR,width=64,height=48 ! appsink sync=false"
    )
    capture = cv2.VideoCapture(pipeline, cv2.CAP_GSTREAMER)
    require(capture.isOpened(), "GStreamer pipeline did not open")
    require(capture.getBackendName() == "GSTREAMER", "pipeline selected the wrong backend")
    ok, generated = capture.read()
    capture.release()
    require(ok and generated is not None, "GStreamer pipeline returned no frame")
    require(generated.shape == frame.shape, "GStreamer returned an unexpected frame shape")

    test_gui_runtime(expected_backend="GTK3")
    print("FFmpeg, GStreamer, and GTK3 runtime operations: PASS")


def test_cuda() -> None:
    count = cv2.cuda.getCudaEnabledDeviceCount()
    print("CUDA devices:", count)
    require(count > 0, "headless-cuda found no usable CUDA device")

    image = np.zeros((96, 128, 3), dtype=np.uint8)
    image[:, :, 1] = 173
    expected_gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    for index in range(count):
        cv2.cuda.setDevice(index)
        gpu_image = cv2.cuda_GpuMat()
        gpu_image.upload(image)
        gpu_gray = cv2.cuda.cvtColor(gpu_image, cv2.COLOR_BGR2GRAY)
        require(
            np.array_equal(gpu_image.download(), image),
            f"GPU {index} upload/download changed the image",
        )
        require(
            np.array_equal(gpu_gray.download(), expected_gray),
            f"GPU {index} CUDA color conversion changed the result",
        )
        print(f"GPU {index}: upload + cvtColor + download PASS")


def main() -> None:
    args = parse_args()
    module_path = Path(cv2.__file__).resolve()
    build_information = cv2.getBuildInformation()
    distributions = normalized_distribution_names()
    installed_wheels = sorted(WHEEL_PACKAGES & distributions)

    require(args.build_info_output.is_absolute(), "--build-info-output must be absolute")
    require(args.build_info_output.parent.is_dir(), "build-info output parent does not exist")
    require(not args.build_info_output.exists(), "build-info output already exists")
    args.build_info_output.write_text(build_information, encoding="utf-8")

    print("OpenCV version:", cv2.__version__)
    print("OpenCV module:", module_path)
    print("Python executable:", Path(sys.executable).resolve())
    print("Python prefix:", Path(sys.prefix).resolve())
    print("Wheel distributions:", ", ".join(installed_wheels) or "none")
    print("GUI:", summary_value(build_information, "GUI"))
    print("FFMPEG:", summary_value(build_information, "FFMPEG"))
    print("GStreamer:", summary_value(build_information, "GStreamer"))
    print("NVIDIA CUDA:", summary_value(build_information, "NVIDIA CUDA"))
    print("cuDNN:", summary_value(build_information, "cuDNN"))

    require(cv2.__version__ == args.version, f"expected OpenCV {args.version}, found {cv2.__version__}")
    test_image_core()

    has_contrib = hasattr(cv2, "xfeatures2d")
    print("Contrib xfeatures2d:", has_contrib)

    if args.mode == "wheel":
        require(
            args.variant is not None
            and args.profile is None
            and args.prefix is None
            and args.dnn_cuda is None,
            "wheel mode received source-profile arguments",
        )
        expected_environment = Path(sys.prefix).resolve()
        require(expected_environment in module_path.parents, "cv2 is outside the selected Python environment")
        require(
            installed_wheels == [args.variant],
            f"expected only {args.variant}; found {installed_wheels or 'no OpenCV wheel distribution'}",
        )
        wheel_release = metadata.version(args.variant)
        print("Wheel distribution version:", wheel_release)
        require(
            wheel_release == "5.0.0.93",
            f"expected {args.variant} distribution 5.0.0.93, found {wheel_release}",
        )
        require(
            has_contrib == ("contrib" in args.variant),
            "contrib capability does not match the selected wheel variant",
        )
        require(cv2.cuda.getCudaEnabledDeviceCount() == 0, "official wheel unexpectedly exposed CUDA execution")
        if args.variant.endswith("headless"):
            require(
                summary_value(build_information, "GUI").startswith("NONE"),
                "headless wheel unexpectedly reports a GUI backend",
            )
        else:
            require(
                not summary_value(build_information, "GUI").startswith("NONE"),
                "desktop wheel reports no GUI backend",
            )
            test_gui_runtime()
        require(
            summary_value(build_information, "FFMPEG").startswith("YES"),
            "official 5.0.0.93 wheel contract expects FFmpeg",
        )
        require(
            summary_value(build_information, "GStreamer").startswith("NO"),
            "official 5.0.0.93 wheel contract expects GStreamer to be disabled",
        )
        print("Official wheel contract: PASS")
        return

    require(
        args.profile is not None and args.prefix is not None and args.variant is None,
        "source mode is missing its profile or prefix",
    )
    expected_prefix = args.prefix.resolve(strict=True)
    require(expected_prefix in module_path.parents, "cv2 is outside the selected OpenCV prefix")
    require(not installed_wheels, f"a wheel shadows the source installation: {installed_wheels}")
    require(has_contrib, "source profiles in this guide require opencv_contrib")

    if args.profile == "desktop-cpu":
        require(args.dnn_cuda is None, "desktop-cpu does not accept --dnn-cuda")
        require(
            disabled_or_omitted(summary_value(build_information, "NVIDIA CUDA")),
            "desktop-cpu was compiled with CUDA support",
        )
        require(cv2.cuda.getCudaEnabledDeviceCount() == 0, "desktop-cpu unexpectedly exposed a CUDA device")
        test_desktop_backends()
    else:
        require(args.dnn_cuda is not None, "headless-cuda requires --dnn-cuda on or off")
        require(summary_value(build_information, "GUI").startswith("NONE"), "headless-cuda reports a GUI backend")
        require(
            disabled_or_omitted(summary_value(build_information, "FFMPEG")),
            "headless-cuda unexpectedly reports FFmpeg",
        )
        require(
            disabled_or_omitted(summary_value(build_information, "GStreamer")),
            "headless-cuda unexpectedly reports GStreamer",
        )
        require("YES" in summary_value(build_information, "NVIDIA CUDA"), "OpenCV was not built with CUDA")
        cudnn_value = summary_value(build_information, "cuDNN")
        dnn_cuda_targets = cv2.dnn.getAvailableTargets(cv2.dnn.DNN_BACKEND_CUDA)
        print("DNN CUDA targets:", list(dnn_cuda_targets))
        if args.dnn_cuda == "on":
            require("YES" in cudnn_value, "--dnn-cuda on requires cuDNN")
            require(
                cv2.dnn.DNN_TARGET_CUDA in dnn_cuda_targets,
                "--dnn-cuda on requires the classic DNN CUDA backend",
            )
        else:
            require(disabled_or_omitted(cudnn_value), "--dnn-cuda off unexpectedly reports cuDNN")
            require(len(dnn_cuda_targets) == 0, "--dnn-cuda off unexpectedly exposes DNN CUDA targets")
        test_cuda()

    print("Source profile contract: PASS")


if __name__ == "__main__":
    try:
        main()
    except VerificationError as error:
        print(f"VERIFICATION FAILED: {error}", file=sys.stderr)
        raise SystemExit(1) from None
