# Training 3D U-Net for Brain Tumor Segmentation (BraTS-GLI)

This folder contains the Jupyter Notebooks for the LearnOpenCV article  - **[Training 3D U-Net for Brain Tumor Segmentation (BraTS2023-GLI)](https://learnopencv.com/3d-u-net-brats/)**.

<img src="readme_images/Feature.gif">


### We have provided:
* code to prepare dataset (`01_Data_Preprocessing.ipynb`)
* Model Training Script (`02_Training_3D_U-Net-83.59iou.ipynb`)
* Video inference code, at the last section of (`02_Training_3D_U-Net-83.59iou.ipynb`)

### Model Download:
- Download trained model from [here](https://www.dropbox.com/scl/fi/in1mx0t674d71bttw5b0p/3D_U-Net_BraTS_ckpt.tar?rlkey=eac3nha5rkyy1fpziifxv2kfq&st=aklryvmc&dl=1) and place it under `model_checkpoint/3D_UNet_Brats2023/version_0/ckpt.tar` . One can simply change the relative model path according to your notebook.

### Instructions:

- Run the `01_Data_Preprocessing.ipynb` to download and preprocess the [**BraTS2023-GLI** Subset from Kaggle](https://www.kaggle.com/datasets/aiocta/brats2023-part-1).
- After data preprocessing steps, switch to `02_Training_3D_U-Net-83.59iou.ipynb` for custom data loader preparation, model definition, training and inference scripts.

You can download the trained weights and code files as well from the below link.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="Download Code" width="200">](https://www.dropbox.com/scl/fo/vm8b1ka80wcspnd7wgmf5/ACUK7u6YoqRNjXtx5B9Fct4?rlkey=k1kqqjqemczem3z74k8uxl7ip&st=nkpkkqr1&dl=1)

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
