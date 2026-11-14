[English](README.md) | 简体中文

<p align="center">
 <img src="./doc/PaddleOCR_log.png" align="middle" width = "600"/>
<p align="center">
<p align="left">
    <a href="./LICENSE"><img src="https://img.shields.io/badge/license-Apache%202-dfd.svg"></a>
    <a href="https://github.com/PaddlePaddle/PaddleOCR/releases"><img src="https://img.shields.io/github/v/release/PaddlePaddle/PaddleOCR?color=ffa"></a>
    <a href=""><img src="https://img.shields.io/badge/python-3.7+-aff.svg"></a>
    <a href=""><img src="https://img.shields.io/badge/os-linux%2C%20win%2C%20mac-pink.svg"></a>
    <a href=""><img src="https://img.shields.io/pypi/format/PaddleOCR?color=c77"></a>
    <a href="https://pypi.org/project/PaddleOCR/"><img src="https://img.shields.io/pypi/dm/PaddleOCR?color=9cf"></a>
    <a href="https://github.com/PaddlePaddle/PaddleOCR/stargazers"><img src="https://img.shields.io/github/stars/PaddlePaddle/PaddleOCR?color=ccf"></a>
</p>

## 简介

PaddleOCR旨在打造一套丰富、领先、且实用的OCR工具库，助力开发者训练出更好的模型，并应用落地。

<div align="center">
    <img src="./doc/imgs_results/ch_ppocr_mobile_v2.0/test_add_91.jpg" width="800">
</div>

<div align="center">
    <img src="./doc/imgs_results/ch_ppocr_mobile_v2.0/00006737.jpg" width="800">
</div>

## 近期更新

- **🔥2022.5.11~13 每晚8：30【超强OCR技术详解与产业应用实战】三日直播课**
  - 11日：开源最强OCR系统PP-OCRv3揭秘
  - 12日：云边端全覆盖的PP-OCRv3训练部署实战
  - 13日：OCR产业应用全流程拆解与实战
  
   赶紧扫码报名吧！
<div align="center">
<img src="https://raw.githubusercontent.com/PaddlePaddle/PaddleOCR/dygraph/doc/joinus.PNG"  width = "150" height = "150" />
</div>

- **🔥2022.5.9 发布PaddleOCR [release/2.5](https://github.com/PaddlePaddle/PaddleOCR/tree/release/2.5)**
    - 发布[PP-OCRv3](./doc/doc_ch/ppocr_introduction.md#pp-ocrv3)，速度可比情况下，中文场景效果相比于PP-OCRv2再提升5%，英文场景提升11%，80语种多语言模型平均识别准确率提升5%以上；
    - 发布半自动标注工具[PPOCRLabelv2](./PPOCRLabel)：新增表格文字图像、图像关键信息抽取任务和不规则文字图像的标注功能；
    - 发布OCR产业落地工具集：打通22种训练部署软硬件环境与方式，覆盖企业90%的训练部署环境需求；
    - 发布交互式OCR开源电子书[《动手学OCR》](./doc/doc_ch/ocr_book.md)，覆盖OCR全栈技术的前沿理论与代码实践，并配套教学视频。
- 2021.12.21 发布PaddleOCR [release/2.4](https://github.com/PaddlePaddle/PaddleOCR/tree/release/2.4)
    - OCR算法新增1种文本检测算法（[PSENet](./doc/doc_ch/algorithm_det_psenet.md)），3种文本识别算法（[NRTR](./doc/doc_ch/algorithm_rec_nrtr.md)、[SEED](./doc/doc_ch/algorithm_rec_seed.md)、[SAR](./doc/doc_ch/algorithm_rec_sar.md)）；
    - 文档结构化算法新增1种关键信息提取算法（[SDMGR](./ppstructure/docs/kie.md)），3种[DocVQA](./ppstructure/vqa)算法（LayoutLM、LayoutLMv2，LayoutXLM）。
- 2021.9.7 发布PaddleOCR [release/2.3](https://github.com/PaddlePaddle/PaddleOCR/tree/release/2.3)
    - 发布[PP-OCRv2](./doc/doc_ch/ppocr_introduction.md#pp-ocrv2)，CPU推理速度相比于PP-OCR server提升220%；效果相比于PP-OCR mobile 提升7%。
- 2021.8.3 发布PaddleOCR [release/2.2](https://github.com/PaddlePaddle/PaddleOCR/tree/release/2.2)
    - 发布文档结构分析[PP-Structure](./ppstructure/README_ch.md)工具包，支持版面分析与表格识别（含Excel导出）。

> [更多](./doc/doc_ch/update.md)

## 特性

支持多种OCR相关前沿算法，在此基础上打造产业级特色模型[PP-OCR](./doc/doc_ch/ppocr_introduction.md)和[PP-Structure](./ppstructure/README_ch.md)，并打通数据生产、模型训练、压缩、预测部署全流程。

![](./doc/features.png)

> 上述内容的使用方法建议从文档教程中的快速开始体验


## 快速开始

- 在线网站体验：超轻量PP-OCR mobile模型体验地址：https://www.paddlepaddle.org.cn/hub/scene/ocr
- 移动端demo体验：[安装包DEMO下载地址](https://ai.baidu.com/easyedge/app/openSource?from=paddlelite)(基于EasyEdge和Paddle-Lite, 支持iOS和Android系统)
- 一行命令快速使用：[快速开始（中英文/多语言/文档分析）](./doc/doc_ch/quickstart.md)

<a name="电子书"></a>
## 《动手学OCR》电子书
- [《动手学OCR》电子书📚](./doc/doc_ch/ocr_book.md)


<a name="开源社区"></a>
## 开源社区

- **加入社区👬：** 微信扫描二维码并填写问卷之后，加入交流群领取福利
  - **获取5月11-13日每晚20:30《OCR超强技术详解与产业应用实战》的直播课链接**
  - **10G重磅OCR学习大礼包：**《动手学OCR》电子书，配套讲解视频和notebook项目；66篇OCR相关顶会前沿论文打包放送，包括CVPR、AAAI、IJCAI、ICCV等；PaddleOCR历次发版直播课视频；OCR社区优秀开发者项目分享视频。

- **社区贡献**🏅️：[社区贡献](./doc/doc_ch/thirdparty.md)文档中包含了社区用户**使用PaddleOCR开发的各种工具、应用**以及**为PaddleOCR贡献的功能、优化的文档与代码**等，是官方为社区开发者打造的荣誉墙，也是帮助优质项目宣传的广播站。
- **社区常规赛**🎁：社区常规赛是面向OCR开发者的积分赛事，覆盖文档、代码、模型和应用四大类型，以季度为单位评选并发放奖励，赛题详情与报名方法可参考[链接](https://github.com/PaddlePaddle/PaddleOCR/issues/4982)。

<div align="center">
<img src="https://raw.githubusercontent.com/PaddlePaddle/PaddleOCR/dygraph/doc/joinus.PNG"  width = "200" height = "200" />
</div>


<a name="模型下载"></a>
## PP-OCR系列模型列表（更新中）

| 模型简介                              | 模型名称                | 推荐场景        | 检测模型                                                     | 方向分类器                                                   | 识别模型                                                     |
| ------------------------------------- | ----------------------- | --------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 中英文超轻量PP-OCRv3模型（16.2M）     | ch_PP-OCRv3_xx          | 移动端&服务器端 | [推理模型](https://paddleocr.bj.bcebos.com/PP-OCRv3/chinese/ch_PP-OCRv3_det_infer.tar) / [训练模型](https://paddleocr.bj.bcebos.com/PP-OCRv3/chinese/ch_PP-OCRv3_det_distill_train.tar) | [推理模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_cls_infer.tar) / [训练模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_cls_train.tar) | [推理模型](https://paddleocr.bj.bcebos.com/PP-OCRv3/chinese/ch_PP-OCRv3_rec_infer.tar) / [训练模型](https://paddleocr.bj.bcebos.com/PP-OCRv3/chinese/ch_PP-OCRv3_rec_train.tar) |
| 英文超轻量PP-OCRv3模型（13.4M）     | en_PP-OCRv3_xx          | 移动端&服务器端 | [推理模型](https://paddleocr.bj.bcebos.com/PP-OCRv3/english/en_PP-OCRv3_det_infer.tar) / [训练模型](https://paddleocr.bj.bcebos.com/PP-OCRv3/english/en_PP-OCRv3_det_distill_train.tar) | [推理模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_cls_infer.tar) / [训练模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_cls_train.tar) | [推理模型](https://paddleocr.bj.bcebos.com/PP-OCRv3/english/en_PP-OCRv3_rec_infer.tar) / [训练模型](https://paddleocr.bj.bcebos.com/PP-OCRv3/english/en_PP-OCRv3_rec_train.tar) |
| 中英文超轻量PP-OCRv2模型（13.0M）     | ch_PP-OCRv2_xx          | 移动端&服务器端 | [推理模型](https://paddleocr.bj.bcebos.com/PP-OCRv2/chinese/ch_PP-OCRv2_det_infer.tar) / [训练模型](https://paddleocr.bj.bcebos.com/PP-OCRv2/chinese/ch_PP-OCRv2_det_distill_train.tar) | [推理模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_cls_infer.tar) / [预训练模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_cls_train.tar) | [推理模型](https://paddleocr.bj.bcebos.com/PP-OCRv2/chinese/ch_PP-OCRv2_rec_infer.tar) / [训练模型](https://paddleocr.bj.bcebos.com/PP-OCRv2/chinese/ch_PP-OCRv2_rec_train.tar) |
| 中英文超轻量PP-OCR mobile模型（9.4M） | ch_ppocr_mobile_v2.0_xx | 移动端&服务器端 | [推理模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_det_infer.tar) / [预训练模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_det_train.tar) | [推理模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_cls_infer.tar) / [预训练模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_cls_train.tar) | [推理模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_rec_infer.tar) / [预训练模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_rec_pre.tar) |
| 中英文通用PP-OCR server模型（143.4M） | ch_ppocr_server_v2.0_xx | 服务器端        | [推理模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_server_v2.0_det_infer.tar) / [预训练模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_server_v2.0_det_train.tar) | [推理模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_cls_infer.tar) / [预训练模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_cls_train.tar) | [推理模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_server_v2.0_rec_infer.tar) / [预训练模型](https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_server_v2.0_rec_pre.tar) |

更多模型下载（包括多语言），可以参考[PP-OCR 系列模型下载](./doc/doc_ch/models_list.md)，文档分析相关模型参考[PP-Structure 系列模型下载](./ppstructure/docs/models_list.md)


<a name="文档教程"></a>
## 文档教程

- [运行环境准备](./doc/doc_ch/environment.md)
- [PP-OCR文本检测识别🔥](./doc/doc_ch/ppocr_introduction.md)
    - [快速开始](./doc/doc_ch/quickstart.md)
    - [模型库](./doc/doc_ch/models_list.md)
    - [模型训练](./doc/doc_ch/training.md)
        - [文本检测](./doc/doc_ch/detection.md)
        - [文本识别](./doc/doc_ch/recognition.md)
        - [文本方向分类器](./doc/doc_ch/angle_class.md)
    - 模型压缩
        - [模型量化](./deploy/slim/quantization/README.md)
        - [模型裁剪](./deploy/slim/prune/README.md)
        - [知识蒸馏](./doc/doc_ch/knowledge_distillation.md)
    - [推理部署](./deploy/README_ch.md)
        - [基于Python预测引擎推理](./doc/doc_ch/inference_ppocr.md)
        - [基于C++预测引擎推理](./deploy/cpp_infer/readme.md)
        - [服务化部署](./deploy/pdserving/README_CN.md)
        - [端侧部署](./deploy/lite/readme.md)
        - [Paddle2ONNX模型转化与预测](./deploy/paddle2onnx/readme.md)
        - [云上飞桨部署工具](./deploy/paddlecloud/README.md)
        - [Benchmark](./doc/doc_ch/benchmark.md)
- [PP-Structure文档分析🔥](./ppstructure/README_ch.md)
    - [快速开始](./ppstructure/docs/quickstart.md)
    - [模型库](./ppstructure/docs/models_list.md)
    - [模型训练](./doc/doc_ch/training.md)
        - [版面分析](./ppstructure/layout/README_ch.md)
        - [表格识别](./ppstructure/table/README_ch.md)
        - [关键信息提取](./ppstructure/docs/kie.md)
        - [DocVQA](./ppstructure/vqa/README_ch.md)
    - [推理部署](./deploy/README_ch.md)
        - [基于Python预测引擎推理](./ppstructure/docs/inference.md)
        - [基于C++预测引擎推理]()
        - [服务化部署](./deploy/pdserving/README_CN.md)
- [前沿算法与模型🚀](./doc/doc_ch/algorithm.md)
    - [文本检测算法](./doc/doc_ch/algorithm_overview.md#11-%E6%96%87%E6%9C%AC%E6%A3%80%E6%B5%8B%E7%AE%97%E6%B3%95)
    - [文本识别算法](./doc/doc_ch/algorithm_overview.md#12-%E6%96%87%E6%9C%AC%E8%AF%86%E5%88%AB%E7%AE%97%E6%B3%95)
    - [端到端算法](./doc/doc_ch/algorithm_overview.md#2-%E6%96%87%E6%9C%AC%E8%AF%86%E5%88%AB%E7%AE%97%E6%B3%95)
    - [使用PaddleOCR架构添加新算法](./doc/doc_ch/add_new_algorithm.md)
- [场景应用](./applications)
- 数据标注与合成
    - [半自动标注工具PPOCRLabel](./PPOCRLabel/README_ch.md)
    - [数据合成工具Style-Text](./StyleText/README_ch.md)
    - [其它数据标注工具](./doc/doc_ch/data_annotation.md)
    - [其它数据合成工具](./doc/doc_ch/data_synthesis.md)
- 数据集
    - [通用中英文OCR数据集](doc/doc_ch/dataset/datasets.md)
    - [手写中文OCR数据集](doc/doc_ch/dataset/handwritten_datasets.md)
    - [垂类多语言OCR数据集](doc/doc_ch/dataset/vertical_and_multilingual_datasets.md)
    - [版面分析数据集](doc/doc_ch/dataset/layout_datasets.md)
    - [表格识别数据集](doc/doc_ch/dataset/table_datasets.md)
    - [DocVQA数据集](doc/doc_ch/dataset/docvqa_datasets.md)
- [代码组织结构](./doc/doc_ch/tree.md)
- [效果展示](#效果展示)
- [《动手学OCR》电子书📚](./doc/doc_ch/ocr_book.md)
- [开源社区](#开源社区)
- FAQ
    - [通用问题](./doc/doc_ch/FAQ.md)
    - [PaddleOCR实战问题](./doc/doc_ch/FAQ.md)
- [参考文献](./doc/doc_ch/reference.md)
- [许可证书](#许可证书)


<a name="效果展示"></a>

## 效果展示 [more](./doc/doc_ch/visualization.md)

<details open>
<summary>PP-OCRv3 中文模型</summary>

<div align="center">
    <img src="doc/imgs_results/PP-OCRv3/ch/PP-OCRv3-pic001.jpg" width="800">
    <img src="doc/imgs_results/PP-OCRv3/ch/PP-OCRv3-pic002.jpg" width="800">
    <img src="doc/imgs_results/PP-OCRv3/ch/PP-OCRv3-pic003.jpg" width="800">
</div>

</details>


<details open>
<summary>PP-OCRv3 英文模型</summary>

<div align="center">
    <img src="doc/imgs_results/PP-OCRv3/en/en_1.png" width="800">
    <img src="doc/imgs_results/PP-OCRv3/en/en_2.png" width="800">
</div>

</details>


<details open>
<summary>PP-OCRv3 多语言模型</summary>

<div align="center">
    <img src="doc/imgs_results/PP-OCRv3/multi_lang/japan_2.jpg" width="800">
    <img src="doc/imgs_results/PP-OCRv3/multi_lang/korean_1.jpg" width="800">
</div>

</details>

<details open>
<summary>PP-Structure 文档分析</summary>

- 版面分析+表格识别  
<div align="center">
    <img src="./ppstructure/docs/table/ppstructure.GIF" width="800">
</div>

- SER（语义实体识别）  
<div align="center">
    <img src="./ppstructure/docs/vqa/result_ser/zh_val_0_ser.jpg" width="800">
</div>

- RE（关系提取）
<div align="center">
    <img src="./ppstructure/docs/vqa/result_re/zh_val_21_re.jpg" width="800">
</div>

</details>

<a name="许可证书"></a>

## 许可证书
本项目的发布受<a href="https://github.com/PaddlePaddle/PaddleOCR/blob/master/LICENSE">Apache 2.0 license</a>许可认证。

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
