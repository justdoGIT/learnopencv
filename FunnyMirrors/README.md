# Funny Mirrors using OpenCV

**This repository contains code for [Funny Mirrors using OpenCV](https://learnopencv.com/Funny-Mirrors-Using-OpenCV/) blog post**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/tn9t8zpovkvaw36/AAD0URDxfYY8rdOWOEzs2B1sa?dl=1)

We show how to create some funny mirror effects using OpenCV. The blog is based on fundamental concepts like camera projection, intrinsic and extrinsic 
camera parameters and mesh-based image warping.

### Installing additional library
```shell
pip3 install vcam
```

### How to run the code

Command line usage for running the code

* Python

  * Running on sample images:
    	
    ```
    python3 FunnyMirrorsImages.py
    ```
    
  * Running on a video file:

    ```
    python3 FunnyMirrorsVideo.py ./data/Video3.mp4 0
    ```
    
    The syntax here is `python3 FunnyMirrorsVideo.py <VIDEO_FILE_PATH> <MODE_NUMBER>`. The `MODE_NUMBER` ranges from 0 to 7. It determines which funny mirror effect will be applied.
    

### Some funny mirrors generated
<img src = "./Mirror-effect-1-image-3.jpg" width = 1000 height = 282/>
<img src = "./Mirror-effect-5-image-3.jpg" width = 1000 height = 282/>



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
