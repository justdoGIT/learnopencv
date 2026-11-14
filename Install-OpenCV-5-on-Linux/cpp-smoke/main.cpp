#include <opencv2/core.hpp>
#include <opencv2/core/cuda.hpp>
#include <opencv2/features.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/xfeatures2d.hpp>

#if OPENCV5_EXPECT_CUDA
#include <opencv2/cudaimgproc.hpp>
#endif

#include <cstddef>
#include <iostream>
#include <regex>
#include <stdexcept>
#include <string>
#include <vector>

int main() {
    if (std::string(CV_VERSION) != "5.0.0") {
        throw std::runtime_error("Expected OpenCV 5.0.0, found " + std::string(CV_VERSION));
    }

    cv::Mat image(192, 256, CV_8UC3, cv::Scalar(0, 0, 0));
    for (int row = 0; row < image.rows; row += 24) {
        for (int column = 0; column < image.cols; column += 24) {
            if (((row / 24) + (column / 24)) % 2 == 0) {
                cv::rectangle(
                    image,
                    cv::Rect(column, row, 24, 24),
                    cv::Scalar(0, 180, 255),
                    cv::FILLED
                );
            }
        }
    }

    std::vector<unsigned char> encoded;
    if (!cv::imencode(".png", image, encoded)) {
        throw std::runtime_error("PNG encoding failed");
    }
    cv::Mat decoded = cv::imdecode(encoded, cv::IMREAD_COLOR);
    if (decoded.empty() || cv::norm(decoded, image, cv::NORM_INF) != 0.0) {
        throw std::runtime_error("PNG round trip changed the image");
    }

    cv::Mat gray;
    cv::cvtColor(image, gray, cv::COLOR_BGR2GRAY);
    std::vector<cv::KeyPoint> keypoints;
    cv::SIFT::create()->detect(gray, keypoints);
    if (keypoints.empty()) {
        throw std::runtime_error("SIFT did not detect any keypoints");
    }
    const std::size_t sift_keypoint_count = keypoints.size();
    cv::Mat brief_descriptors;
    cv::xfeatures2d::BriefDescriptorExtractor::create()->compute(
        gray, keypoints, brief_descriptors
    );
    if (brief_descriptors.empty()) {
        throw std::runtime_error("BRIEF contrib descriptor extraction failed");
    }

    const int device_count = cv::cuda::getCudaEnabledDeviceCount();
#if OPENCV5_EXPECT_CUDA
    if (device_count <= 0) {
        throw std::runtime_error("CUDA profile found no usable GPU");
    }
    for (int index = 0; index < device_count; ++index) {
        cv::cuda::setDevice(index);
        cv::cuda::GpuMat gpu_image;
        cv::cuda::GpuMat gpu_gray;
        gpu_image.upload(image);
        cv::cuda::cvtColor(gpu_image, gpu_gray, cv::COLOR_BGR2GRAY);

        cv::Mat downloaded_image;
        cv::Mat downloaded_gray;
        gpu_image.download(downloaded_image);
        gpu_gray.download(downloaded_gray);
        if (cv::norm(downloaded_image, image, cv::NORM_INF) != 0.0 ||
            cv::norm(downloaded_gray, gray, cv::NORM_INF) != 0.0) {
            throw std::runtime_error("CUDA round trip changed the result");
        }
        std::cout << "GPU " << index << ": upload + cvtColor + download PASS\n";
    }
#else
    const std::regex cuda_enabled(R"((^|\n)\s*NVIDIA CUDA:\s*YES)");
    if (std::regex_search(cv::getBuildInformation(), cuda_enabled)) {
        throw std::runtime_error("CPU profile was compiled with CUDA support");
    }
    if (device_count != 0) {
        throw std::runtime_error("CPU profile unexpectedly exposed a CUDA device");
    }
#endif

    std::cout << "OpenCV " << CV_VERSION << '\n';
    std::cout << "In-memory PNG round trip: PASS\n";
    std::cout << "SIFT keypoints: " << sift_keypoint_count << '\n';
    std::cout << "BRIEF descriptors: " << brief_descriptors.rows << '\n';
    std::cout << "CUDA devices: " << device_count << '\n';
    return 0;
}
