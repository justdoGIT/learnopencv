# How to convert a model from PyTorch to TensorRT and speed up inference

**This repository contains code for [How to convert a model from PyTorch to TensorRT and speed up inference](https://www.learnopencv.com/how-to-convert-a-model-from-pytorch-to-tensorrt-and-speed-up-inference/) blogpost**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/mn3vommt37lngnf/AACwN2fUsPFM1XOGlZgWbqqPa?dl=1)

To run PyTorch part:
```shell script
python3.12 -m venv venv
source venv/bin/activate
python3 -m pip install -r requirements.txt
python3 pytorch_model.py
```

To run TensorRT part:
1. Download and install NVIDIA CUDA 10.0 or later following by official instruction: [link](https://developer.nvidia.com/cuda-10.0-download-archive)
2. Download and extract CuDNN library for your CUDA version (login required): [link](https://developer.nvidia.com/rdp/cudnn-download)
3. Download and extract NVIDIA TensorRT library for your CUDA version (login required): 
[link](https://developer.nvidia.com/nvidia-tensorrt-6x-download). 
The minimum required version is 6.0.1.5. 
Please follow the [Installation Guide](https://docs.nvidia.com/deeplearning/tensorrt/install-guide/index.html) for your system and don't forget to install Python's part
4. Add the absolute path to CUDA, TensorRT, CuDNN libs to the environment variable ```PATH``` or ```LD_LIBRARY_PATH``` 
5. Install [PyCUDA](https://docs.nvidia.com/deeplearning/tensorrt/install-guide/index.html#installing-pycuda)

```shell script
python3 trt_inference.py
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
