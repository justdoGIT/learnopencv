# TensorFlow Lite: Model Optimization for On-Device Machine Learning

**This repository contains code for [TensorFlow Lite: Model Optimization for On-Device Machine Learning](https://learnopencv.com/tensorflow-lite-model-optimization-for-on-device-machine-learning) blogpost**.


<img src="https://learnopencv.com/wp-content/uploads/2022/05/tflite_feature_image-1-scaled.jpg" align="middle">

## Install Requirements

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/6wjtg7edkdyrv1a/AAAwqeIq_4NZtMK_MoP5l00Ja?dl=1)

```
python3 -m venv .venv
source .venv/bin/activate
pip install -U pip
pip install -r requirements.txt
```

Tested with Python 3.12.x. The notebook now enables `TF_USE_LEGACY_KERAS=1` before importing TensorFlow so that `tensorflow-model-optimization==0.8.0` works correctly with TensorFlow 2.16. If you run the code outside the notebook, set that environment variable before importing TensorFlow.

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
