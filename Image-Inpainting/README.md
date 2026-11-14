# Image Inpainting with OpenCV (C++/Python)

**This repository contains the code for [Image Inpainting with OpenCV (C++/Python)](https://learnopencv.com/image-inpainting-with-opencv-c-python/) blog post**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/z6nb29e6i4kzk0m/AABvm0ggBw3cfQkTc9Yn_PtZa?dl=1)

## Usage

### Python

```
python3 inpaint.py sample.jpeg
```

### C++

```
g++ inpaint.cpp `pkg-config opencv --cflags --libs` -o inpaint
./inpaint sample.jpeg
```
You can also **cmake** as follows:

```
mkdir build && cd build
cmake ..
cmake --build . --config Release
```

The built code can then be used as follows:

```
./build/inpaint sample.jpeg
```

## Performance Comparison

```
Time: FMM = 194445.94073295593 ms
Time: NS = 179731.82344436646 ms
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
