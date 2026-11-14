# Deep Learning based Character Classification using Synthetic Dataset

This repository contains code for the blog post [Deep Learning based Character Classification using Synthetic Dataset](https://learnopencv.com/deep-learning-character-classification-using-synthetic-dataset/).

<img src="https://learnopencv.com/wp-content/uploads/2019/06/LeNet.png" alt="Character Classification" width="900">

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/scl/fo/pm77bjh1ugopxeb3mfwnt/h?dl=1&rlkey=yh1wy8h1ati0erfmxqplntqtv)


**Step 1:**

Download backgrounds and put the light and dark backgrounds separately. We'll be using them for creating synthetic dataset. We have uploaded sample backgrounds in light_backgrounds and dark_backgrounds for reference. 

**Step 2:**

Download fonts from [here](https://fonts.google.com/). These fonts will be used for randomly selected font-type while creating synthetic dataset. 

**Step 3:**

Create synthetic data using ImageMagick. We have given an intuition behind creating synthetic data, in our blog. This can be done with following command:

`python3 generate-images.py` 

The script first generates two directories *light_background_crops* and *dark_background_crops* containing 32x32 backgrounds crops. It then adds text and other artifacts like blur/noise/distortion to the backgrounds. To regenerate all data, delete *light_background_crops* and *dark_background_crops*. To generate training images, open the script and set OUTPUT_DIR = 'train/' and NUM_IMAGES_PER_CLASS = 800. Similarly, to generate test images, set OUTPUT_DIR = 'test/' and NUM_IMAGES_PER_CLASS = 200. 

**Step 4:** 

Training the model on the given dataset. A modified LeNet structure has been used to train our model, using Keras. This can be done with following command:

`python3 train_model.py`

**Step 5:**

In order to predict the digit or character in an image, execute the following command. Give the test image path as the argument. 

`python3 make_predictions.py <image_path>`


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
