"""Offline SDK/parser checks: mock HTTP, fake credentials, no inference request."""

from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

try:
    import httpx
    from openai import AsyncOpenAI
    from PIL import Image

    import meta_sam31_video_api as example
except ModuleNotFoundError:
    example = None


# Published meta-sam-parser one_bit fixture, with deliberately sparse IDs.
LINE = ("<2f>7<|box;x1=10;y1=20;x2=14;y2=24;w=100;h=80|>"
        "<|mask;x=0;y=0;data=5,5,!!!!!(QO(0lu8?|>\n")


def events(text: str, completed: bool = True) -> str:
    lane = {"item_id": "msg-fixture", "output_index": 0, "content_index": 0}
    values = [
        {"type": "response.output_item.added", "output_index": 0,
         "item": {"id": "msg-fixture", "type": "message", "role": "assistant", "content": []}},
        {"type": "response.content_part.added", **lane,
         "part": {"type": "output_text", "text": ""}},
    ]
    if text:
        # Split inside a structured record to exercise incremental parsing.
        values.extend([
            {"type": "response.output_text.delta", **lane, "delta": text[:80]},
            {"type": "response.output_text.delta", **lane, "delta": text[80:]},
        ])
    values.append({"type": "response.content_part.done", **lane,
                   "part": {"type": "output_text", "text": text}})
    if completed:
        values.append({"type": "response.completed", "response": {"status": "completed"}})
    return "".join("data: " + json.dumps(value) + "\n\n" for value in values)


@unittest.skipIf(example is None, "Install requirements-api.txt for hosted API checks")
class MetaApiTests(unittest.IsolatedAsyncioTestCase):
    async def run_fixture(self, text: str, *, completed: bool = True, output_dir=None):
        def respond(request):
            body = json.loads(request.content)
            self.assertEqual(str(request.url), "https://api.meta.ai/v1/responses")
            self.assertEqual(body["model"], "sam-3.1")
            self.assertEqual(body["input"][0]["content"], [
                {"type": "input_text", "text": "person"},
                {"type": "input_video", "video_url": "https://example.invalid/fixture.mp4"},
            ])
            self.assertEqual(body["metadata"], {"mask_encoding": "one_bit"})
            self.assertTrue(body["stream"])
            return httpx.Response(200, headers={"content-type": "text/event-stream"},
                                  text=events(text, completed))

        def mocked_client(**kwargs):
            return AsyncOpenAI(**kwargs, http_client=httpx.AsyncClient(
                transport=httpx.MockTransport(respond)))

        with patch.object(example, "AsyncOpenAI", mocked_client):
            return await example.segment_video(
                "https://example.invalid/fixture.mp4", "person",
                api_key="offline-fixture-no-real-key", output_dir=output_dir,
            )

    async def test_split_payload_sparse_ids_and_half_open_bounds(self):
        rows = await self.run_fixture(LINE)
        self.assertEqual(rows, [{
            "frame": 2, "object_id": "7", "revision": 1, "mask_shape": [5, 5],
            "foreground_pixels": 10, "box_xyxy": [10, 20, 15, 25],
        }])

    async def test_latest_revision_replaces_previous_object_frame_mask(self):
        revised = LINE.replace("x1=10;y1=20;x2=14;y2=24", "x1=30;y1=40;x2=34;y2=44")
        with tempfile.TemporaryDirectory() as directory:
            rows = await self.run_fixture(LINE + revised, output_dir=directory)
            self.assertEqual(len(rows), 1)
            self.assertEqual(rows[0]["frame"], 2)
            self.assertEqual(rows[0]["object_id"], "7")
            self.assertEqual(rows[0]["revision"], 2)
            self.assertEqual(rows[0]["box_xyxy"], [30, 40, 35, 45])
            self.assertEqual(len(list(Path(directory).glob("*.png"))), 1)
            manifest = json.loads((Path(directory) / "masks.json").read_text())
            self.assertEqual(manifest["masks"], rows)

    async def test_zero_matches_is_valid_and_has_empty_manifest(self):
        with tempfile.TemporaryDirectory() as directory:
            rows = await self.run_fixture("", output_dir=directory)
            self.assertEqual(rows, [])
            manifest = json.loads((Path(directory) / "masks.json").read_text())
            self.assertEqual(manifest["masks"], [])

    async def test_incomplete_stream_is_not_saved_as_success(self):
        with tempfile.TemporaryDirectory() as directory:
            with self.assertRaisesRegex(RuntimeError, "Incomplete segmentation"):
                await self.run_fixture(LINE, completed=False, output_dir=directory)
            self.assertEqual(list(Path(directory).iterdir()), [])

    async def test_png_crop_and_manifest_preserve_decoded_mask(self):
        with tempfile.TemporaryDirectory() as directory:
            rows = await self.run_fixture(LINE, output_dir=directory)
            manifest = json.loads((Path(directory) / "masks.json").read_text())
            self.assertEqual(manifest["masks"], rows)
            self.assertEqual(manifest["mask_space"], "box-local")
            with Image.open(Path(directory) / rows[0]["mask_file"]) as image:
                self.assertEqual(image.size, (5, 5))
                self.assertEqual(image.mode, "L")
                pixels = image.tobytes()
                self.assertEqual(set(pixels), {0, 255})
                self.assertEqual(sum(pixels) // 255, 10)
            # Reusing a populated run directory must fail before sending a request.
            with patch.object(example, "AsyncOpenAI") as client:
                with self.assertRaisesRegex(ValueError, "output_dir must be empty"):
                    await example.segment_video(
                        "https://example.invalid/fixture.mp4", "person",
                        api_key="offline-fixture-no-real-key", output_dir=directory,
                    )
                client.assert_not_called()

    async def test_bad_input_and_missing_key_fail_before_network(self):
        with patch.object(example, "AsyncOpenAI") as client:
            with self.assertRaisesRegex(ValueError, "HTTP"):
                await example.segment_video("input.mp4", "person", api_key="fixture")
            with patch.dict(example.os.environ, {}, clear=True):
                with self.assertRaisesRegex(ValueError, "MODEL_API_KEY"):
                    await example.segment_video("https://example.invalid/clip.mp4", "person")
            client.assert_not_called()


if __name__ == "__main__":
    unittest.main()
