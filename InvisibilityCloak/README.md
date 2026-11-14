# Invisibility Cloak using simple CV techniques in OpenCV

**This repository contains the code for [Invisibility Cloak using simple CV techniques in OpenCV](https://learnopencv.com/invisibility-cloak-using-color-detection-and-segmentation-with-opencv/) blog post**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/his8txfsumpqxfa/AACD-15szUbJkBTK-pRyZ72pa?dl=1)

Create your own invisibility cloak using OpenCV

## Download the input video

The input video can be downloaded using this link: https://drive.google.com/file/d/1rc13wZ9zC03ObG5zB3uccUtsg_rsI8hC/view?usp=sharing

## Using the C++ code

### Compilation

To compile the **`Invisibility_Cloak.cpp`** code, use the following:

```
mkdir build
cd build
cmake ..
cmake --build . --config Release
```

### Usage

Refer to the following to use the compiled file:

```
./build/Invisibility_Cloak --video=Input.mp4
```

To take input from camera, use:

```
./build/Invisibility_Cloak
```

## Using the Python code

### Usage

Refer to the following to use the Python script:

```
python Invisibility_Cloak.py --video Input.mp4
```

To take input from camera, use:

```
python Invisibility_Cloak.py
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
