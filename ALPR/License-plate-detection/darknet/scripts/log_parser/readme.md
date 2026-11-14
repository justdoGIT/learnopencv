#### parsing training log and plot 
**Requirement** 
1.  ** matplotlib needed ** 

**Usage** 
1. --source-dir  the directory of training log files 
2. --save-dir the directory to save loss curve, image and csv file
3. --log-file  log file name to be parsed 
4. --csv-file csv file name to save loss data, default it's same with training log file name
5. --show  whether to show after finished parsing, default False, just works on windows or linux with GUI desktop

`python log_parser.py --source-dir ./ --save-dir ./ --log-file test.log --show true`

![plot](https://github.com/Adesun/darknet/blob/log_parser/scripts/log_parser/plot.jpg)






  

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
