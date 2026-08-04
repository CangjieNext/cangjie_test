#!/usr/bin/env python3

"""Verify that ConsoleReader.read returns before stdin is closed."""

import os
import queue
import subprocess
import sys
import threading


READ_TIMEOUT_SECONDS = 3.0


def format_read(payload):
    return f"{len(payload)}:{list(payload)}".encode("ascii")


def read_lines(stream, line_count, result_queue):
    try:
        result_queue.put(([stream.readline() for _ in range(line_count)], None))
    except Exception as error:  # Forward reader-thread failures to the main thread.
        result_queue.put(([], error))


def stop_process(process):
    if process.poll() is not None:
        return
    process.terminate()
    try:
        process.wait(timeout=READ_TIMEOUT_SECONDS)
    except subprocess.TimeoutExpired:
        process.kill()
        process.wait(timeout=READ_TIMEOUT_SECONDS)


def run_case(
    command,
    payload,
    expected_lines,
    *,
    mode="partial",
    close_stdin_before_read=False,
):
    environment = os.environ.copy()
    environment["CJ_STDIN_PARTIAL_READ_MODE"] = mode
    process = subprocess.Popen(
        command,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        env=environment,
    )
    result_queue = queue.Queue(maxsize=1)
    reader = threading.Thread(
        target=read_lines,
        args=(process.stdout, len(expected_lines), result_queue),
        daemon=True,
    )

    try:
        reader.start()
        if payload:
            process.stdin.write(payload)
            process.stdin.flush()
        if close_stdin_before_read:
            process.stdin.close()

        try:
            output_lines, error = result_queue.get(timeout=READ_TIMEOUT_SECONDS)
        except queue.Empty as timeout_error:
            raise AssertionError(
                f"stdin read timed out in {mode!r} mode"
            ) from timeout_error

        if error is not None:
            raise AssertionError(f"failed to read child stdout: {error}")

        if any(line == b"" for line in output_lines):
            stop_process(process)
            stderr = process.stderr.read().decode("utf-8", errors="replace")
            raise AssertionError(
                f"child closed stdout before producing all results in {mode!r} mode: "
                f"{stderr}"
            )

        normalized_lines = [line.rstrip(b"\r\n") for line in output_lines]
        if normalized_lines != expected_lines:
            raise AssertionError(
                f"unexpected child output in {mode!r} mode: "
                f"expected {expected_lines!r}, got {normalized_lines!r}"
            )

        if not process.stdin.closed:
            process.stdin.close()
        process.wait(timeout=READ_TIMEOUT_SECONDS)
        if process.returncode != 0:
            stderr = process.stderr.read().decode("utf-8", errors="replace")
            raise AssertionError(
                f"child exited with {process.returncode}: {stderr}"
            )
    finally:
        stop_process(process)
        if process.stdin is not None and not process.stdin.closed:
            process.stdin.close()
        if process.stdout is not None:
            process.stdout.close()
        if process.stderr is not None:
            process.stderr.close()


def main():
    try:
        separator = sys.argv.index("--")
    except ValueError as error:
        raise SystemExit("usage: check_stdin_partial_read.py -- <command> [args...]") from error

    command = sys.argv[separator + 1 :]
    if not command:
        raise SystemExit("missing executable command")

    run_case(command, b"test data\n", [format_read(b"test data\n")])
    run_case(command, b"test data", [format_read(b"test data")])
    run_case(
        command,
        b"abcdef",
        [format_read(b"abcd"), format_read(b"ef")],
        mode="small",
    )
    run_case(
        command,
        b"abcdef\n",
        [b"Some(a)", format_read(b"bcdef\n")],
        mode="buffered",
    )
    run_case(
        command,
        b"first\nsecond",
        [b"Some(first)", format_read(b"second")],
        mode="mixed",
    )
    run_case(command, b"", [format_read(b"")], mode="empty")
    run_case(
        command,
        b"",
        [format_read(b"")],
        mode="eof",
        close_stdin_before_read=True,
    )
    print("PASS")


if __name__ == "__main__":
    main()
