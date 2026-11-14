
# Variational Autoencoder in TensorFlow

**This repsitory contains code and instructions for the [Variational Autoencoder in Tensorflow](https://learnopencv.com/variational-autoencoder-in-tensorflow) blogpost**.

## Package Dependencies

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/gj39qjvne6lsx5e/AADNlERXgARutPci9K_1be_Ha?dl=1)

The repository trains the Variational Autoencoder in Tensorflow framework on Fashion-MNIST and Cartoon dataset. The cartoon dataset can be download from [here](https://google.github.io/cartoonset/).

The current requirements have been validated with Python 3.12.x. Create a fresh virtual environment and install the pinned dependencies before running the notebook locally.

```python
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install -U pip
pip install -r requirements.txt
```

## Add Virtualenv as Python Kernel in Jupyterlab

- Activate the virtualenv

```python
$ source your-venv/bin/activate
```

- Add the virtualenv as a jupyter kernel

```python
(your-venv)$ ipython kernel install --name "local-venv" --user
```

Replace `local-venv` with your virtualenv name.

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
