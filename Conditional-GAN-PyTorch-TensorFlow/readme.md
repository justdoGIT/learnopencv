# Conditional GAN in TensorFlow and PyTorch
This repository **This repository contains code for [Conditional GAN in TensorFlow and PyTorch](https://learnopencv.com/conditional-gan-cgan-in-pytorch-and-tensorflow/) blogpost**.

## Package Dependencies
[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/wsmi6eo4bzqyat0/AABM7LHduc8tU55j7CR6kQE-a?dl=1)


This repository trains Conditional GANs in both PyTorch and TensorFlow on the Fashion-MNIST and Rock-Paper-Scissors datasets. The current requirements have been validated with Python 3.12.x.

```
python3 -m venv .venv
source .venv/bin/activate
pip install -U pip
pip install -r requirements.txt
```

The PyTorch script now falls back to CPU automatically when the installed CUDA build does not support the available GPU.

## Directory Structure

```
├── PyTorch
│   ├── CGAN-PyTorch.ipynb
│   └── cgan_pytorch.py
└── TensorFlow
    ├── CGAN-FashionMnist-TensorFlow.ipynb
    ├── cgan_fashionmnist_tensorflow.py
    ├── CGAN-RockPaperScissor-TensorFlow.ipynb
    └── cgan_rockpaperscissor_tensorflow.py
```

## Instructions

### PyTorch

To train the Conditional GAN with PyTorch, go into the `PyTorch` folder and execute either the Python script or the notebook.

### TensorFlow

To train the Conditional GAN with TensorFlow, go into the `TensorFlow` folder and execute the notebook or script.


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
