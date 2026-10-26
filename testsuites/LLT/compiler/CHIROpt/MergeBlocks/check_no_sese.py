#!/usr/bin/env python3
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

"""Fail if a dumped CHIR function still has a single-entry single-exit GoTo edge.

Matches MergeBlocks::checkSingleEntrySingleExit (without -g/--coverage):
the block has exactly one predecessor, that predecessor's only successor is this
block, and the predecessor terminator is GoTo. MATCH_PATTERN / UNREACHABLE
blocks are skipped, same as SkipMergeBlock.
"""

import re
import sys

BLOCK_HDR = re.compile(
    r"^(?P<indent>\s*)(?P<attrs>(?:\[[^\]]+\]\s+)*)Block #(?P<id>\d+):"
)
PREDS = re.compile(r"predecessors:\s*\[([^\]]*)\]")
GOTO = re.compile(r"\bGoTo\(#(\d+)\)")
BRANCH = re.compile(r"\b(?:Branch|MultiBranch)\(")
EXIT_LIKE = re.compile(r"\b(?:Exit|RaiseException|Return)\(")


def _pred_ids(text: str) -> list[int]:
    m = PREDS.search(text)
    if not m:
        return []
    inner = m.group(1).strip()
    if not inner:
        return []
    ids = []
    for part in inner.split(","):
        tok = part.strip()
        if tok.startswith("#"):
            ids.append(int(tok[1:]))
    return ids


def _attrs(prefix: str) -> set[str]:
    return set(re.findall(r"\[([^\]]+)\]", prefix))


def _successors(lines: list[str]) -> tuple[str, list[int]]:
    """Return (kind, successor ids) from the last terminator-like line."""
    for line in reversed(lines):
        s = line.strip()
        if not s or s.startswith("Block ") or s.startswith("["):
            continue
        g = GOTO.search(s)
        if g and not BRANCH.search(s):
            return "goto", [int(g.group(1))]
        if s.startswith("Branch(") or " Branch(" in s:
            ids = [int(x) for x in re.findall(r"#(\d+)", s)]
            return "branch", ids
        if "MultiBranch(" in s:
            ids = [int(x) for x in re.findall(r"#(\d+)", s)]
            return "multibranch", ids
        if EXIT_LIKE.search(s):
            return "exit", []
    return "none", []


def parse_blocks(text: str) -> dict[int, dict]:
    lines = text.splitlines()
    blocks: dict[int, dict] = {}
    i = 0
    while i < len(lines):
        m = BLOCK_HDR.match(lines[i])
        if not m:
            i += 1
            continue
        bid = int(m.group("id"))
        header = lines[i]
        attrs = _attrs(m.group("attrs"))
        body: list[str] = []
        i += 1
        while i < len(lines):
            # Nested BlockGroups (Lambda / ForIn) indent inner `Block #` more
            # deeply; they are still real blocks and must not be swallowed as
            # the outer block's body.
            if BLOCK_HDR.match(lines[i]):
                break
            if lines[i].strip() == "}":
                break
            body.append(lines[i])
            i += 1
        kind, succs = _successors(body)
        blocks[bid] = {
            "id": bid,
            "attrs": attrs,
            "preds": _pred_ids(header),
            "kind": kind,
            "succs": succs,
        }
    return blocks


def find_sese(blocks: dict[int, dict]) -> list[str]:
    bad = []
    for bid, blk in blocks.items():
        if "matchPattern" in blk["attrs"] or "unreachable" in blk["attrs"]:
            continue
        if len(blk["preds"]) != 1:
            continue
        pred_id = blk["preds"][0]
        pred = blocks.get(pred_id)
        if pred is None:
            continue
        if pred["kind"] != "goto" or pred["succs"] != [bid]:
            continue
        bad.append(
            f"Block #{bid} is still SESE: only pred is #{pred_id}, "
            f"and #{pred_id} terminator is GoTo(#{bid})"
        )
    return bad


def main() -> int:
    text = sys.stdin.read()
    if "Func " not in text and "Block #" not in text:
        print("check_no_sese: empty or invalid CHIR on stdin", file=sys.stderr)
        return 1
    blocks = parse_blocks(text)
    if not blocks:
        print("check_no_sese: no blocks parsed", file=sys.stderr)
        return 1
    bad = find_sese(blocks)
    if bad:
        print("check_no_sese: remaining single-entry single-exit GoTo blocks:")
        for line in bad:
            print(f"  {line}")
        return 1
    print("check_no_sese: pass")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
