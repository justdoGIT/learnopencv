# Making a Low-Cost Stereo Camera Using OpenCV

**This repository contains code for [Making a low-cost stereo camera using OpenCV](https://www.learnopencv.com/making-a-low-cost-stereo-camera-using-opencv/) blogpost**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/7vs36qm9ntx5m7c/AAB88GWgDoCnNpJ4EAU3cRIra?dl=1)

## Using the C++ code
### Compilation
To compile the `calibrate.cpp`, `capture_images.cpp` and `movie3d.cpp` code files, use the following:
```shell
mkdir build
cd build
cmake ..
cmake --build . --config Release
```
## Usage
Refer to the following to use the compiled files:

```shell
./build/capture_images
./build/calibrate
./build/movie3d
```

### Using the python code

Refer to the following to use the `calibrate.py`, `capture_images.py` and `movie3d.py` files respectively:

```shell
python3 calibrate.py
python3 capture_images.py
python3 movie3d.py
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
