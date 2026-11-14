
# PaddleOCR DB/EAST/PSE 算法训练benchmark测试

PaddleOCR/benchmark目录下的文件用于获取并分析训练日志。
训练采用icdar2015数据集，包括1000张训练图像和500张测试图像。模型配置采用resnet18_vd作为backbone，分别训练batch_size=8和batch_size=16的情况。

## 运行训练benchmark

benchmark/run_det.sh 中包含了三个过程：
- 安装依赖
- 下载数据
- 执行训练
- 日志分析获取IPS

在执行训练部分，会执行单机单卡（默认0号卡）单机多卡训练，并分别执行batch_size=8和batch_size=16的情况。所以执行完后，每种模型会得到4个日志文件。

run_det.sh 执行方式如下:

```
# cd PaddleOCR/
bash benchmark/run_det.sh
```

以DB为例，将得到四个日志文件，如下：
```
det_res18_db_v2.0_sp_bs16_fp32_1
det_res18_db_v2.0_sp_bs8_fp32_1
det_res18_db_v2.0_mp_bs16_fp32_1
det_res18_db_v2.0_mp_bs8_fp32_1
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
