# Exploring DINO: Self-Supervised Transformers for Road Segmentation with ResNet50 and U-Net

This folder contains the Jupyter Notebooks and scripts for the LearnOpenCV article  - **[Exploring DINO: Self-Supervised Transformers for Road Segmentation with ResNet50 and U-Net](https://learnopencv.com/fine-tune-dino-self-supervised-learning-segmentation/)**.

<img src="media/dino_road_segmentation_featured_gif_v2.gif">


### We have provided:
* code to prepare dataset (`data_prep.ipynb`)
* Model Training Script (`training.ipynb`)
* Video inference code (`inference.ipynb`)



### Model Download:
- Download trained model from [here](https://www.dropbox.com/scl/fi/o3p22mfd726hq0bcqin91/model_epoch_24.pth?rlkey=6jrm8cm7ge0m5vugo4fsj399o&st=j27jwke5&dl=1) and place it under `models/base_line_e50_v2/`

### Recommended File Structure:
```bash
├── data
│   ├── csv
│   ├── idd-segmentation
│   │   └── IDD_Segmentation
│   │       ├── csv
│   │       ├── gtFine
│   │       │   ├── train
│   │       │   └── val
│   │       └── leftImg8bit
│   │           ├── test
│   │           ├── train
│   │           └── val
├── public-code
│    ├── domain_adaptation
│    │   ├── source
│    │   │   └── core
│    │   │       └── csvs
│    │   └── target
│    │       ├── semi-supervised
│    │       └── weakly-supervised
│    ├── evaluation
│    ├── helpers
│    ├── preperation
│    └── viewer
├── models
│   └── base_line_e50_v2
│   └── model_epoch_24.pth
├── training.ipynb
├── data_prep.ipynb
├── inference.ipynb
├── README.md
```

You can download the trained weights and code files as well from the below link.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="Download Code" width="200">](https://www.dropbox.com/scl/fo/k6lbqmkaczd7hzmf51zja/AHc58Rd4xv0bPZBtLs3JJ-Q?rlkey=e1vhsq6p8dy2i9dj8ogwxwrek&st=jecbc04c&dl=1)

![](readme_images/handwritten-text-recognition-using-ocr.gif)

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
