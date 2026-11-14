# Demystifying GPU architectures for deep learning

**This folder contains code for the following blog posts**.
1. [Demystifying GPU architectures for deep learning part 1](https://learnopencv.com/demystifying-gpu-architectures-for-deep-learning/)
2. [Demystifying GPU architectures for deep learning part 2](https://learnopencv.com/demystifying-gpu-architectures-for-deep-learning-part-2/)

<img src="https://learnopencv.com/wp-content/uploads/2022/07/Demystifying-GPU-architectures-for-deep-learning.jpg" alt="Demystifying GPU architectures for deep learning">

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="Download Code" width="200">](https://www.dropbox.com/sh/b5y85yjyt1cxizn/AACpsOeqXcLJUMclEql7qXiEa?dl=1)

## Environment
All code was tested on a PC with RTX 3090 and AMD Ryzen 5800X.

Kernel version:
```Shell
sf@trantor:~/Downloads$ uname -r
5.4.0-121-generic
```
## How to use

### Compile and run

```Shell
nvcc cuda_matmul.cu -lm -o cu_mm.out
./cu_mm.out 2048 256 512
```

### Results

On the tested system, the GPU was about 650 times faster than the CPU.


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
