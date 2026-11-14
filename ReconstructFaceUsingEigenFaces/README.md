# Face Reconstruction using EigenFaces

The repository contains code for the blog post [Face Reconstruction using EigenFaces](https://www.learnopencv.com/face-reconstruction-using-eigenfaces-cpp-python/).

<p align="center"><img src="https://learnopencv.com/wp-content/uploads/2018/01/face-reconstruction-using-eigenfaces.jpg" alt="EigenFaces" width="900"></p>

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/scl/fo/dwcfw2tg65dxt1ijbtnje/h?dl=1&rlkey=q3cc6nxe3t6gt76fdutr59trd)


## Steps to Train you own Model

1. Download [images](http://www.learnopencv.com/wp-content/uploads/2018/01/CalebA-1000-images.zip). These images are the first 1000 images of the [CelebA dataset](http://mmlab.ie.cuhk.edu.hk/projects/CelebA.html). You can create a larger model by using more [aligned and cropped images](https://www.dropbox.com/sh/8oqt9vytwxb3s4r/AADIKlz8PR9zr6Y20qbkunrba/Img/img_align_celeba.zip?dl=0) from the CelebA dataset. 
2. Use **createPCAModel.cpp** or **createPCAModel.py** to create the modelfile **pcaParams.yml**.
3. Use **reconstructFace.cpp** or **reconstructFace.py** to reconstruct the face. It needs the **pcaParams.yml** file. 


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
