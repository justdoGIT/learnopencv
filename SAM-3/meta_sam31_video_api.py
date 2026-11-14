"""Segment a hosted video with SAM 3.1 through Meta Model API.

Install requirements-api.txt and set MODEL_API_KEY before running this file.
The CLI sends a billable request; it requires access to sam-3.1 on your Meta
Model API account. Hugging Face checkpoint approval is a separate access path.
The SDK/parser integration is tested offline, not against a paid inference run.
"""

from __future__ import annotations

import argparse
import asyncio
import json
import os
from pathlib import Path
from urllib.parse import urlsplit

from meta_sam_parser import (
    CompletedOutcome,
    SegmentationMaskRecord,
    decode_mask_to_raster,
    parse_responses_stream,
    video_segmentation_format,
)
from openai import AsyncOpenAI
from PIL import Image


def summarize_masks(result, output_dir: Path | None = None) -> list[dict]:
    """Decode complete masks; optionally save box-local PNGs and a manifest.

    Frame indices and object IDs come from the response, not list positions.
    Bounds use the parser's half-open source-frame coordinates. PNGs contain
    only the returned mask crop, with 0 for background and 255 for foreground.
    """
    if not isinstance(result.outcome, CompletedOutcome):
        raise RuntimeError(f"Incomplete segmentation: {result.outcome}")
    if result.diagnostics:
        raise RuntimeError(f"Parser diagnostics: {result.diagnostics}")

    # A completed parser result retains revisions for an object/frame identity.
    # Export only its latest accepted mask, rather than conflicting old crops.
    latest_masks = {}
    for record in result.records:
        if not isinstance(record, SegmentationMaskRecord):
            continue
        previous = latest_masks.get(record.identity)
        if previous is None or record.revision > previous.revision:
            latest_masks[record.identity] = record

    summaries = []
    for record in latest_masks.values():
        if record.frame is None:
            raise RuntimeError("A video mask is missing its source frame index.")
        # The official decoder returns row-major bytes containing zeros and ones.
        raster = decode_mask_to_raster(record.mask)
        row = {
            "frame": record.frame.frame_index,
            "object_id": record.object_id,
            "revision": record.revision,
            "mask_shape": [record.mask.height, record.mask.width],
            "foreground_pixels": sum(raster),
            "box_xyxy": [record.bounds.left, record.bounds.top,
                         record.bounds.right, record.bounds.bottom],
        }
        if output_dir is not None:
            # Use a local sequence for filenames; preserve the API IDs in JSON.
            filename = f"mask-{len(summaries):06d}.png"
            image = Image.frombytes(
                "L", (record.mask.width, record.mask.height), raster
            ).point(lambda value: value * 255)
            image.save(output_dir / filename)
            row["mask_file"] = filename
        summaries.append(row)

    if output_dir is not None:
        manifest = {
            "model": "sam-3.1",
            "mask_space": "box-local",
            "box_xyxy_convention": "half-open source-frame coordinates",
            "png_values": {"background": 0, "foreground": 255},
            "masks": summaries,
        }
        (output_dir / "masks.json").write_text(
            json.dumps(manifest, indent=2) + "\n", encoding="utf-8"
        )
    return summaries


async def segment_video(
    video_url: str,
    prompt: str,
    *,
    api_key: str | None = None,
    output_dir: str | Path | None = None,
) -> list[dict]:
    """Send one concept/video request and collect its final parsed masks.

    Use ``await segment_video(...)`` in Jupyter. This example accepts HTTP(S)
    video URLs and collects the response in memory, so start with a short clip.
    ``output_dir``, when supplied, must be empty to avoid mixing separate runs.
    """
    parsed_url = urlsplit(video_url)
    if parsed_url.scheme not in {"http", "https"} or not parsed_url.netloc:
        raise ValueError("video_url must be an HTTP(S) URL accessible to Meta.")
    if not prompt.strip():
        raise ValueError("Supply one short concept phrase, such as 'person'.")
    key = api_key or os.environ.get("MODEL_API_KEY")
    if not key:
        raise ValueError("Set MODEL_API_KEY or supply api_key before calling Meta.")

    destination = Path(output_dir) if output_dir is not None else None
    if destination is not None:
        destination.mkdir(parents=True, exist_ok=True)
        if any(destination.iterdir()):
            raise ValueError("output_dir must be empty; choose a new run directory.")

    async with AsyncOpenAI(
        base_url="https://api.meta.ai/v1",
        api_key=key,
        # An explicit rerun should be a deliberate new request.
        max_retries=0,
    ) as client:
        events = await client.responses.create(
            model="sam-3.1",
            input=[{"type": "message", "role": "user", "content": [
                {"type": "input_text", "text": prompt.strip()},
                {"type": "input_video", "video_url": video_url},
            ]}],
            metadata={"mask_encoding": "one_bit"},
            stream=True,
        )
        parsed = parse_responses_stream(events, video_segmentation_format())
        async with parsed:
            result = await parsed.final_result()
    return summarize_masks(result, destination)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("video_url", help="Public URL of a supported MP4/MOV clip")
    parser.add_argument("--prompt", default="person", help="One concept phrase")
    parser.add_argument("--output-dir", type=Path, help="Empty directory for mask PNGs and masks.json")
    args = parser.parse_args()
    if not os.environ.get("MODEL_API_KEY"):
        parser.error("Set MODEL_API_KEY in your environment before calling Meta.")
    summaries = asyncio.run(segment_video(
        args.video_url, args.prompt, output_dir=args.output_dir
    ))
    print(f"Decoded {len(summaries)} object-frame masks")
    for summary in summaries[:10]:
        print(summary)
    if args.output_dir is not None:
        print(f"Saved masks and manifest to {args.output_dir.resolve()}")


if __name__ == "__main__":
    main()
