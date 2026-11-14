
# Introduction to OpenVino Deep Learning Workbench

**This repository contains code for [Introduction-to-OpenVino-Deep-Learning Workbench](https://learnopencv.com/introduction-to-openvino-deep-learning-workbench/) blogpost**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/a24l0pv1void1x2/AABTW645rgofOTTlDHlCbOxua?dl=1)

And the following as well,

* Python file to create the results JSON file for the COCO validation dataset.
* Juptyter notebook for calculating the mAP.


## Instructions

### Download the Video Used in the Post

* Download the video used in the post for inference from [this link](https://www.pexels.com/video/people-wearing-face-mask-in-public-area-4562551/).

### Getting the JSON Results File 

* To get the results JSON file for COCO validation set:

  * Execute `object_detection_demo_coco.py` by providing the correct path to the MS COCO validation dataset by editing the Python file.

  * Execute using the following commands:

    ```
    python object_detection_demo_coco.py --model frozen_darknet_yolov4_model.xml -at yolo -i mscoco/val2017 --loop -t 0.2 --no_show -r -nireq 4
    ```
    
  * ***Note:*** Check that the path to the `.xml` file is for the INT8 model.


### mAP Calculation

* Put the `pycocoEvalDemo.ipynb` in the `cocoapi/PythonAPI`.

* Run the `pycocoEvalDemo.ipynb` Notebook by providing the correct path the `results.json` 
* The correct path to the MS COCO evaluation JSON file also needs to be provided. Please check the path according to your directory structure of the MS COCO dataset.



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
