# YOLOX Object Detector Paper Explanation and Custom Training

This repository contains notebooks for Training YOLOX on a custom dataset. Find detailed explanation in the blog post [YOLOX Object Detector Paper Explanation and Custom Training](https://learnopencv.com/yolox-object-detector-paper-explanation-and-custom-training/).


<img src="https://learnopencv.com/wp-content/uploads/2022/10/yolox-object-detector-paper-explanation-and-custom-training-feature-image-768x422.gif" alt="YOLOX Training" width="1000">

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/09euceuiivm4yon/AADK5i85x0dZS-HTZEOaMZWea?dl=1)

### Colab Notebooks

 - [Dataset Preparation](https://colab.research.google.com/github/spmallick/learnopencv/blob/master/YOLOX-Object-Detection-Paper-Explanation-and-Custom-Training/DataGenerator.ipynb)
 - [Training](https://colab.research.google.com/github/spmallick/learnopencv/blob/master/YOLOX-Object-Detection-Paper-Explanation-and-Custom-Training/YOLOX_training_on_custom_drone_dataset.ipynb)

### Installation on Local

Current YOLOX upstream still has a VOC evaluation bug that can crash custom training during validation with a broadcasting error. Apply the small patch below after cloning the repo.

```
git clone https://github.com/Megvii-BaseDetection/YOLOX.git

cd YOLOX

python3 - <<'PY'
from pathlib import Path

voc_file = Path("yolox/data/datasets/voc.py")
source = voc_file.read_text()
old = "                if dets == []:\n"
new = "                if len(dets) == 0:\n"
if old not in source and new not in source:
    raise RuntimeError("Could not find YOLOX VOC evaluation guard to patch.")
voc_file.write_text(source.replace(old, new))
print("Patched YOLOX VOC evaluator empty-detection check.")
PY

pip install -v -e .
```

### Training

Check out [the article](https://learnopencv.com/yolox-object-detector-paper-explanation-and-custom-training/) for training instructions.

### Results

<img src="https://learnopencv.com/wp-content/uploads/2022/10/drone-swarm-detection-by-yolox-m-25-epochs.jpg" alt="YOLOX medium inference example" width="1000">

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
