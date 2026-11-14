# Decoding Virat Kohli's Flick Shot: AI-Based 3D Motion Reconstruction

**This repository contains the code for the LearnOpenCV blog post [Decoding Virat Kohli's Flick Shot: AI-Based 3D Motion Reconstruction](https://learnopencv.com/decoding-virat-kohlis-flick-shot-ai-based-3d-motion-reconstruction/).**

[![Decoding Virat Kohli's Flick Shot: AI-Based 3D Motion Reconstruction](https://cdn.learnopencv.com/wp-content/uploads/2026/07/16015539/decoding-virat-kohli-flick-shot-3d-motion-reconstruction.png)](https://learnopencv.com/decoding-virat-kohlis-flick-shot-ai-based-3d-motion-reconstruction/)

The **Bat Swing Plane Pipeline** reconstructs the 3D swing trajectory of a cricket bat from a single, ordinary 2D video, with no sensors, motion-capture studio, or multi-camera rig. It chains together off-the-shelf vision models and physics-based filtering:

1. **Trim & stabilize** the clip by locking onto the pitch's crease lines
2. **Segment** the bat in every frame
3. **Estimate depth** to recover the missing third dimension
4. **Find keypoints** (bat handle and tip) and combine them with the depth map
5. **Physics fill & render** the swing plane with a Kalman RTS smoother

Every model in the stack is used off-the-shelf, never trained on cricket data.

## Models used

| Stage | Model |
|---|---|
| Player and wrist tracking | YOLO26-Pose (`yolo26x-pose.pt`) |
| Bat detection | YOLO26 (`yolo26x.pt`) |
| Pitch crease detection | Grounding DINO (`IDEA-Research/grounding-dino-tiny`) |
| Pitch crease tracking | SAM 2 (`sam2_hiera_large.pt`) |
| Depth estimation | Depth Anything V2 (`depth-anything/Depth-Anything-V2-Large-hf`) |
| Bat segmentation | SAM 3.1 (`sam3.1_multiplex.pt`) |

## Repository contents

```
bat_swing_plane_v2.ipynb   # the full pipeline, run top to bottom
input/vk_flick_1.mp4        # sample input clip
requirements_gpu.yml        # conda environment
```

## Requirements

- **GPU with at least 32 GB VRAM**
- Conda (Miniconda or Anaconda)
- Jupyter with `ipykernel`

## Setup

**1. Create the environment and register the Jupyter kernel:**

```bash
conda env create -f requirements_gpu.yml -n bat_env
conda run -n bat_env python -m ipykernel install --user --name bat_env --display-name "bat_env"
```

> `requirements_gpu.yml` pins a PyTorch nightly build for very new GPU architectures. If that exact build is no longer on the nightly index, install the latest matching nightly for your CUDA version instead.

**2. Get the SAM 3 library.** This repository does not bundle it. Clone Meta's Segment Anything 3 into a `sam3/` folder alongside the notebook:

```bash
git clone https://github.com/facebookresearch/sam3
```

**3. Download the model weights** into a `weights/` folder alongside the notebook. Weights are not included in this repository; download them from their original sources:

| File | Source |
|---|---|
| `sam3.1_multiplex.pt` | [Meta – Segment Anything 3](https://github.com/facebookresearch/sam3) |
| `sam2_hiera_large.pt` | [Meta – Segment Anything 2](https://github.com/facebookresearch/segment-anything-2) |
| `yolo26x.pt`, `yolo26x-pose.pt` | [Ultralytics YOLO](https://docs.ultralytics.com/) (auto-download on first use) |
| Depth Anything V2 | [Hugging Face](https://huggingface.co/depth-anything/Depth-Anything-V2-Large-hf) (auto-download on first use) |

**4. Run the notebook.** Select the `bat_env` kernel and run the sections in order, top to bottom.

## Authors

This code accompanies the LearnOpenCV blog post and was written by:

- Adnan Shaikh
- Om Rope


## References

- [Ultralytics YOLO](https://docs.ultralytics.com/)
- [Segment Anything 3 (SAM 3.1)](https://github.com/facebookresearch/sam3)
- [Segment Anything 2 (SAM 2)](https://github.com/facebookresearch/segment-anything-2)
- [Depth Anything V2](https://huggingface.co/depth-anything/Depth-Anything-V2-Large-hf)
- [Grounding DINO](https://github.com/IDEA-Research/GroundingDINO)

---

# AI Courses by OpenCV

Want to become an expert in AI? [AI Courses by OpenCV](https://opencv.org/courses/) is a great place to start.

[![AI Courses by OpenCV](https://www.learnopencv.com/wp-content/uploads/2023/01/AI-Courses-By-OpenCV-Github.png)](https://opencv.org/courses/)

