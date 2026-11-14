# PyTorch to CoreML model conversion

**This repository contains the code for [PyTorch to CoreML model conversion](https://learnopencv.com/pytorch-to-coreml-model-conversion/) blog post**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/flirha33aorrlrz/AADu-XLuR_BQFO5ZhgYNPaZIa?dl=1)

## Installation

All required libraries collected in the requirements.txt file. To create a new virtual environment and install the requirements, you can use these commands:

```
$ virtualenv -p python3.7 venv
$ source venv/bin/activate
$ pip install -r requirements.txt
```

## Run the script

To convert any model from `torchvision.models` you can try our script by using this command:

```
$ python3 torch_to_coreml.py --model_name resnet18 --simplify
```

The `--model_name` argument should contain the name of any model from `torchvision.models`

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
