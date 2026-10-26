# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

"""Check member and adapted top-level readFully with real child pipes."""

import os
import queue
import subprocess
import sys
import threading


TIMEOUT = 10


def run_case(command, mode):
    scenario = mode[len("adapter_"):] if mode.startswith("adapter_") else mode
    environment = os.environ.copy()
    environment["CJ_READ_FULLY_MODE"] = mode
    process = subprocess.Popen(
        command, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
        stderr=subprocess.PIPE, env=environment,
    )
    lines = queue.Queue()

    def read_stdout():
        try:
            for line in process.stdout:
                lines.put(line.rstrip(b"\r\n"))
            lines.put(None)
        except Exception as error:
            lines.put(error)

    reader = threading.Thread(target=read_stdout, daemon=True)
    reader.start()

    def expect(expected):
        actual = lines.get(timeout=TIMEOUT)
        if actual != expected:
            raise AssertionError(f"{mode}: expected {expected!r}, got {actual!r}")

    try:
        expect(b"READY")
        if scenario == "empty":
            expect(b"FULL:[]")
        else:
            process.stdin.write(b"abc")
            process.stdin.flush()
            if scenario == "complete":
                try:
                    unexpected = lines.get(timeout=0.3)
                except queue.Empty:
                    pass
                else:
                    raise AssertionError(f"returned before full input: {unexpected!r}")
                process.stdin.write(b"defgh")
                process.stdin.flush()
                expect(b"FULL:[97, 98, 99, 100, 101, 102, 103, 104]")
            else:
                process.stdin.close()
                expect(b"INCOMPLETE:[97, 98, 99, 0, 0, 0, 0, 0]")

        # Completion and empty-buffer cases must exit while the writer is open.
        status = process.wait(timeout=TIMEOUT)
        if status != 0:
            raise AssertionError(f"{mode}: exit={status}, stderr={process.stderr.read()!r}")
    finally:
        if not process.stdin.closed:
            process.stdin.close()
        if process.poll() is None:
            process.kill()
        process.wait(timeout=TIMEOUT)
        reader.join(timeout=TIMEOUT)
        if reader.is_alive():
            raise AssertionError("stdout reader did not terminate")
        process.stdout.close()
        process.stderr.close()


def main():
    command = sys.argv[sys.argv.index("--") + 1:]
    if not command:
        raise ValueError("missing child command")
    for mode in ("complete", "incomplete", "empty", "adapter_complete", "adapter_incomplete", "adapter_empty"):
        run_case(command, mode)
        print(f"PASS readFully pipe {mode}")


if __name__ == "__main__":
    main()
