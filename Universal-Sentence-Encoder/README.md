# Universal Sentence Encoder

**This repository contains code for [Universal Sentence Encoder](https://www.learnopencv.com/universal-sentence-encoder/) blog post**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/qa21gf9k1z88wlu/AAC2YN02UF4lC8MgHs-22AtDa?dl=1)

## Instructions
First install the dependencies.

```
pip3 install --quiet "tensorflow>=1.7"
pip3 install --quiet tensorflow-hub
pip3 install --quiet seaborn
```

To run the **message encoder example**, use:
`python3 embedMessages.py`

To run the **Semantic Similarity Analysis on Avengers:Infinity Warcast**, use:
`cd Avengers-Similarity-Analysis`

`python3 process-script.py`
This will process the raw script and remove all the text contained in brackets.

Next, we have to extract the dialogues of the characters.

`python3 get-character-lines.py`

Finally, use the Universal Sentence Encoder for running Semantic Similarity Analysis.

`python3 universal-sentence-encoder.py`

This will display and save the Similarity Matrix as **Avenger-semantic-similarity.png**.


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
