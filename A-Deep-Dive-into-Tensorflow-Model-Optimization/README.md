# Deep Dive into Tensorflow Model Optimization Toolkit

The repository contains a notebook comparing different model optimization techniques. You can also checkout the [colab notebook](https://colab.research.google.com/github/spmallick/learnopencv/blob/master/A-Deep-Dive-into-Tensorflow-Model-Optimization/TensorFlow_Model_Optimization_Deeper_Dive_into_Model_Optimization.ipynb) here. Find out detailed explanation in the blog post [Deep Dive into tensorFlow Model Optimization Toolkit](https://learnopencv.com/deep-dive-into-tensorflow-model-optimization-toolkit/).

<img src="https://learnopencv.com/wp-content/uploads/2022/05/TFMOT-feature-image.jpg" alt="TFMOT" width="800">

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/12pxp55xd2jpahq/AAAdb3S-mp5r14eqzdybCONva?dl=1)

## Requirements

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
