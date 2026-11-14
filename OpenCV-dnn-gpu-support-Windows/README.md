## How to use OpenCV DNN Module with Nvidia GPU on Windows

**This repository contains the code for [How to use OpenCV DNN Module with Nvidia GPU on Windows](https://www.learnopencv.com/how-to-use-opencv-dnn-module-with-nvidia-gpu-on-windows) blogpost**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/diefx6xylzn8ip4/AABCxrfLKwrCV65nRLQqblNLa?dl=1)

## Models

Download models from the following sources.

[COCO](https://www.dropbox.com/s/2h2bv29a130sgrk/pose_iter_440000.caffemodel?dl=1)

[MPI](https://www.dropbox.com/s/drumc6dzllfed16/pose_iter_160000.caffemodel?dl=1)

## Run Code:

### C++
```
mkdir build
cd build
cmake -G "Visual Studio 16 2019" ..
cmake --build . --config Release
cd ..
./build/Release/OpenPoseVideo <input_file> <gpu/cpu>
```

### Python
```
python OpenPoseVideo.py --device=<cpu/gpu> 
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
