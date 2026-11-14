# Building An Automated Image Annotation Tool: PyOpenAnnotate

This respository contains code for the blog post [Building An Automated Image Annotation Tool: PyOpenAnnotate](https://learnopencv.com/building-automated-image-annotation-tool-pyopenannotate).

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">]()

## Installation 

```
pip install pyOpenAnnotate
```

## How To Use pyOpenAnnotate?
Annotating images using pyOpenAnnotate is pretty simple. Use the command `annotate` followed by the following flags as per the requirement.

### 1. Annotate Images

```
annotate --img <images_directory_path>
```

### 2. Annotate Video
```
annotate --vid <path_to_video_file>
```
### 3. Global Flags
```
-T : View mask window.
--resume <existing-annotations-dir>: Continue from where you left off.
--skip <int(Frames)> : Frames to skip while processing a video file.
```

### 4. Mouse Controls
```
Click and Drag: Draw bounding boxes.
Double Click: Remove existing annotation.
```

## Display Annotations
Visualize your annotations using the `showlbls` command.
```
showlbls --img <single_image_or_a_directory> --ann <single_annotation_text_file_or_a_directory>
```

## Keyboard Navigation
```
N or D : Save and go to next image
B or A : Save and go back
C : Toggle clear screen (during annotation)
T : Toggle mask window (during annotation)
Q : Quit
```

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
