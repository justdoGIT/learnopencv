
# Face recognition with ArcFace

**This repository contains code for [Face recognition with ArcFace](https://www.learnopencv.com/face-recognition-with-arcface/) blogpost**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/peco9u3q485tems/AADaPVWIPn-Ly1LnuLKjHnmKa?dl=1)

## Original source code

Some parts of the code and trained face identification model are from [face.evoLVe](https://github.com/ZhaoJ9014/face.evoLVe.PyTorch) repository which is released under the [MIT License](https://github.com/ZhaoJ9014/face.evoLVe.PyTorch/blob/master/LICENSE). Huge thanks to them!

## Installation

Use your Python virtual environment such as [virtualenv](https://virtualenv.pypa.io/en/latest/) to isolate project.

```
python3.12 -m venv face-recognition
source face-recognition/bin/activate
```

Then install all dependencies.

```
pip install -r requirements.txt
```

_Note: GPU is not required to run this code, but model inference will be faster if you have one._

## Model
Download checkpoint for a model from [GoogleDrive](https://drive.google.com/drive/folders/1omzvXV_djVIW2A7I09DWMe9JR-9o_MYh)/[Baidu](https://pan.baidu.com/s/1L8yOF1oZf6JHfeY9iN59Mg#list/path=%2Fms1m-ir50) and move it to `checkpoint/backbone_ir50_ms1m_epoch120.pth`

## Data

All datasets with faces must support [ImageFolder](https://pytorch.org/docs/stable/torchvision/datasets.html#imagefolder) format. Look at the prepared examples in `data` directory. For all subsequent commands use `tags` argument to select specific datasets in `data` directory.

## Data preprocessing
To prepare data with cropped and aligned faces from your original images, run:

```
python face_alignment.py --tags actors actresses musk woman --crop_size 112
```

_Note: crop_size argument must be either 112 or 224._

## Similarity visualization

To visualize similarity between faces in table format, run:

```
python similarity.py --tags actors actresses musk woman
```

The result for each dataset will be saved in `images` directory.

## t-SNE visualization

To use t-SNE for dimensionality reduction and 2D visualization of face embeddings, run:

```
python tsne.py --tags actors actresses musk woman
```

Results will be plotted in a separate window. You can enlarge the image to look at details.


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
