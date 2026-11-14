# Snowman-Detector-using-YOLOv5



## Instructions to Run the Notebook

The notebook swill run end to end on Colab by doing **Run all**.

### For Training

* Make the `TRAIN = True` under the **Constant/Config Setup** heading. Can also choose the number of epochs here.
* If only wanting to run validation, make `TRAIN = False`. But for this already a trained model should be present.

### train_yolov5_snowman_small_train_all.ipynb

* This notebook trains a YOLOv5 small model entirely. All layers are trained.

### train_yolov5_snowman_medium_freeze_layers.ipynb

* This notebook trains a YOLOv5 medium model by freezing the first 21 layers and training the top few layers only.
* Additionally this notebook contains Weights and Biases logging and shows the ground truth images with bounding boxes.



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
