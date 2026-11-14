# Multi-Label Image Classification with Pytorch

**This repository contains the code for [Multi-Label Image Classification with Pytorch](https://www.learnopencv.com/multi-label-image-classification-with-pytorch/) blog post**.

[<img src="https://learnopencv.com/wp-content/uploads/2022/07/download-button-e1657285155454.png" alt="download" width="200">](https://www.dropbox.com/sh/u724xma4pcfkj5w/AADkrsQAnT_MMqK7vxKqvmZ0a?dl=1)

## Export To Triton Inference Server

This example predicts three categorical outputs from one image: `color`, `gender`, and `article`.
Even though the blog post uses the phrase "multi-label", the model in this folder is implemented as a
multi-output classifier with three separate heads.

You can export a trained checkpoint to an ONNX-based Triton model repository with:

```bash
python3 export_to_triton.py \
  --checkpoint ./checkpoints/<run>/checkpoint-000050.pth \
  --attributes_file ./fashion-product-images/styles.csv \
  --model_repository ./triton_model_repository \
  --model_name fashion_multi_output
```

This creates the following layout:

```text
triton_model_repository/
  fashion_multi_output/
    config.pbtxt
    color_labels.txt
    gender_labels.txt
    article_labels.txt
    metadata.json
    1/
      model.onnx
```

`metadata.json` stores the preprocessing metadata and all label names. The `*_labels.txt` files are used by
Triton's classification extension so the server can return both the top index and the matching label.

Start Triton by mounting the generated repository:

```bash
docker run --rm --gpus all \
  -p8000:8000 -p8001:8001 -p8002:8002 \
  -v $(pwd)/triton_model_repository:/models \
  nvcr.io/nvidia/tritonserver:<triton-tag>-py3 \
  tritonserver --model-repository=/models
```

At inference time you have two common options:

1. Request raw tensors for `color`, `gender`, and `article`, run `argmax` on each output, and map the index to a
   string using `metadata.json`.
2. Request Triton's classification output for each head and let Triton return strings of the form
   `<score>:<index>:<label>`.

For HTTP/REST, the second option looks like this at the output level:

```json
{
  "outputs": [
    { "name": "color", "parameters": { "classification": 1 } },
    { "name": "gender", "parameters": { "classification": 1 } },
    { "name": "article", "parameters": { "classification": 1 } }
  ]
}
```

Keep the preprocessing consistent with training: RGB input, `float32`, NCHW layout, and normalization using
the `mean` and `std` values from `dataset.py`.

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
