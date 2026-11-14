# Object Detection using YOLOv5 and OpenCV DNN (C++/Python)

**This repository contains the code for [Object Detection using YOLOv5 and OpenCV DNN in C++ and Python](https://learnopencv.com/object-detection-using-yolov5-and-opencv-dnn-in-c-and-python/) blogpost**.


<img src="https://learnopencv.com/wp-content/uploads/2022/04/yolov5-feature-image.gif" alt="Introduction to YOLOv5 with OpenCV DNN" width="950">

## Install Dependancies

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/f41c0c6hvdw25ws/AABb2gk5SdkYLPopkz-u3dzia?dl=1)

```
pip install -r requirements.txt
```
List of tutorials for installing OpenCV for C++ [here](https://learnopencv.com/category/install/).


## Execution
### Python
```Python
python yolov5.py
```
### CMake C++ Linux
```C++ Linux
mkdir build
cd build
cmake ..
cmake --build .
./main
```
### CMake C++ Windows
```C++ Windows
rmdir /s /q build
cmake -S . -B build
cmake --build build --config Release
.\build\Release\main.exe
```

---

<p align="center">
  <a href="https://bigvision.ai/">
    <img src="https://bigvision.ai/logos/logo.png" alt="BigVision.AI" width="300">
  </a>
</p>

<h2 align="center">Build Production-Ready Computer Vision &amp; AI Solutions</h2>

<p align="center">
  LearnOpenCV is maintained by <a href="https://bigvision.ai/"><strong>BigVision.AI</strong></a>, a computer vision and AI consulting company. We help organizations design, build, optimize, and deploy production-ready AI solutions. Our team has deep expertise in computer vision, deep learning, multimodal AI, and edge deployment, with experience solving complex technical challenges across industries.
</p>

<p align="center">
  Have a project in mind? Talk with our expert AI solution builders.
</p>

<p align="center">
  <a href="https://bigvision.ai/expert-ai-solution-builders?utm_source=locv-github">
    <img src="https://img.shields.io/badge/Get%20in%20Touch-087EA4?style=for-the-badge" alt="Get in Touch with BigVision.AI">
  </a>
</p>
