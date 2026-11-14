# Deep Learning with OpenCV's DNN Module

**This repsitory contains code for [Deep Learning with OpenCV DNN Module: A Definitive Guide](https://learnopencv.com/deep-learning-with-opencvs-dnn-module-a-definitive-guide/) blogpost**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/5qn1qivoz4f97ro/AAB2kWYR1deNgJBlG3N5QSnEa?dl=1)

## Directory Structure

**All the code files and folders follow the following structure.**

```
├── cpp
│   ├── classify
│   │   ├── classify.cpp
│   │   └── CMakeLists.txt
│   └── detection
│       ├── detect_img
│       │   ├── CMakeLists.txt
│       │   └── detect_img.cpp
│       └── detect_vid
│           ├── CMakeLists.txt
│           └── detect_vid.cpp
├── input
│   ├── classification_classes_ILSVRC2012.txt
│   ├── DenseNet_121.caffemodel
│   ├── DenseNet_121.prototxt
│   ├── frozen_inference_graph.pb
│   ├── image_1.jpg
│   ├── image_2.jpg
│   ├── object_detection_classes_coco.txt
│   ├── ssd_mobilenet_v2_coco_2018_03_29.pbtxt.txt
│   └── video_1.mp4
├── outputs
│   ├── image_result.jpg
│   ├── result_image.jpg
│   └── video_result.mp4
├── python
│   ├── classification
│   │   ├── classify.py
│   │   └── README.md
│   ├── detection
│   │   ├── detect_img.py
│   │   └── detect_vid.py
│   └── requirements.txt
└── README.md
```



## Instructions

### Python

To run the code in Python, please go into the `python` folder and execute the Python scripts in each of the respective sub-folders.

### C++

To run the code in C++, please go into the `cpp` folder, then go into each of the respective sub-folders and follow the steps below:

```
mkdir build
cd build
cmake ..
cmake --build . --config Release
cd ..
./build/classify
```

```
mkdir build
cd build
cmake ..
cmake --build . --config Release
cd ..
./build/detect_img
```

```
mkdir build
cd build
cmake ..
cmake --build . --config Release
cd ..
./build/detect_vid
```



## Outputs

### Image Classification

* ![](outputs/result_image.jpg)

### Object Detection

* ![](outputs/image_result.jpg)

  

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
