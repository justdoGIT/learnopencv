# Pothole Detection using YOLOv4 and Darknet

**This repository contains the code for [Pothole Detection using YOLOv4 and Darknet](https://learnopencv.com/pothole-detection-using-yolov4-and-darknet/) blog post**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/qlydlz7xlsjoq3a/AAAC1y4Ma0TnnGJR2mgNzgSia?dl=1)

**Here we train YOLOv4 and YOLOv4-Tiny models with 4 different experimental settings on a pothole detection dataset. We also run inference in real-time using the trained models.**

* The `jupyter_notebook` directory contains the Jupyter Notebook which will run end-to-end with one click. You can either run it locally if you have CUDA and cuDNN installed. Or you can upload the notebook to Colab and run it in a GPU enabled environment.

- The `custom_inference_script` directory contains the customized `darknet_video.py` Python file. The Darknet code has been customized to show the FPS on the videos when running the inference. After cloning and building Darknet, replace the original `darknet_video.py` file with the one in the `custom_inference_script` directory. 



***Download the YOLOv4 Pothole dataset trained weights [from here](https://drive.google.com/file/d/1vXTyWuvFCy7P0GEvQLYtpcxDi6yqZ9ce/view?usp=sharing).***



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
