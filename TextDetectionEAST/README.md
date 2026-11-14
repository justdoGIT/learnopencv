# Deep Learning based Text Detection Using OpenCV (C++/Python)

**This repository contains the code for [Deep Learning based Text Detection Using OpenCV (C++/Python)](https://learnopencv.com/deep-learning-based-text-detection-using-opencv-c-python/) blog post**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/ak664y0psousrx0/AAAf1U0eaA5egBpsqSoBop41a?dl=1)

Text detection using OpenCV DNN

## Getting the EAST Model

1. The `text detection` scripts use **EAST Model** which can be downloaded using this link: https://www.dropbox.com/s/r2ingd0l3zt8hxs/frozen_east_text_detection.tar.gz?dl=1

2. Once the file has been downloaded (~85 MB), unzip it using `tar -xvzf frozen_east_text_detection.tar.gz`.

3. After unzipping, copy the **`.pb`** model file to the working directory.

## Using the C++ code

### Compilation

To compile the **`text_detection.cpp`**, use the following:

```
cmake .
make
```

### Usage

Refer to the following to use the compiled file:

```
./textDetection --input=<input image path>
```

## Using the Python code

### Usage

Refer to the following to use the Python script:

```
python text_detection.py --input <image_path>
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
