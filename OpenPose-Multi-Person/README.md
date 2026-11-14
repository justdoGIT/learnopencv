# Multi Person Pose Estimation in OpenCV using OpenPose

**This repository contains code for [Multi Person Pose Estimation in OpenCV using OpenPose](https://www.learnopencv.com/multi-person-pose-estimation-in-opencv-using-openpose) blog post**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/wekj1ybydke70rw/AAAZDGuEqYuU_FC-26LkSQIfa?dl=1)

A.Requirements : 
1. OpenCV > 3.4.1
2. Matplotlib for Notebook
3. RUN getModels.sh from command line Or Download caffe model from http://posefs1.perception.cs.cmu.edu/Users/ZheCao/pose_iter_440000.caffemodel and put it in pose/coco folder


B.Compiling cpp file

Using g++
Command to compile the cpp file in ubuntu:

g++ -o3 -std=c++11 multi-person-openpose.cpp `pkg-config --libs --cflags opencv` -lpthread -o multi-person-openpose

Using CMake
cmake .
make

C. Usage
1. Python

python multi-person-openpose.py

2. C++

./multi-person-openpose


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
