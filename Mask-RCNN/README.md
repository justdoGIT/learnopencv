## Deep learning based Object Detection and Instance Segmentation using Mask RCNN in OpenCV (Python / C++)

**This repository contains code for [Deep learning based Object Detection and Instance Segmentation using Mask RCNN in OpenCV (Python / C++)](https://learnopencv.com/deep-learning-based-object-detection-and-instance-segmentation-using-mask-rcnn-in-opencv-python-c/) blog post**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/2u9g88r16g8te38/AABZBNbRkhSEIqzIvji9iamTa?dl=1)

**Python**

`wget http://download.tensorflow.org/models/object_detection/mask_rcnn_inception_v2_coco_2018_01_28.tar.gz`
`tar zxvf mask_rcnn_inception_v2_coco_2018_01_28.tar.gz`

Download and extract the needed model files.

**Usage Examples :**

**Python**

`python3 mask_rcnn.py --image=cars.jpg`
`python3 mask_rcnn.py --video=cars.mp4`

It starts the webcam - if no argument provided.

**C++**

Compile using:

```g++ -ggdb `pkg-config --cflags --libs /Users/snayak/opencv/build/unix-install/opencv.pc` mask_rcnn.cpp -o mask_rcnn.out```

Run using:
`./mask_rcnn.out --image=cars.jpg`
`./mask_rcnn.out --video=cars.mp4`


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
