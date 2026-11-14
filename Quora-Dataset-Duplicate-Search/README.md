# Duplicate Search on Quora Dataset

**This repository contains the code for [Duplicate Search on Quora Dataset](https://learnopencv.com/duplicate-search-on-quora-dataset/) blog post**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/491rn8l2kvauylq/AAAPqUnff5R4l5crqWMnJuSEa?dl=1)

First make sure that the following python modules are installed:

```
pip3 install --quiet "tensorflow>=1.7"
pip3 install --quiet tensorflow-hub
pip3 install --quiet seaborn
```

Next, to run the **Semantic Similarity Analysis** using **Universal Sentence Encoder** use the following:

`python Quora-Duplicate-Search.py`

Enter the number of lines to read from the CSV file for analysis (for example, 1000).

The duplicate sentences found will be written in the file `similarity-results.txt`.  


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
