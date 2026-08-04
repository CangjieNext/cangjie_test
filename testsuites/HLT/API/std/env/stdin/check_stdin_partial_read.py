# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

"""Verify that ConsoleReader.read returns available stdin bytes without false EOF."""

import ast
import os
import queue
import subprocess
import sys
import tempfile
import threading


READ_TIMEOUT_SECONDS = 10.0
CLEANUP_TIMEOUT_SECONDS = 3.0
QUIET_WAIT_SECONDS = 0.3


def format_read(payload):
    return f"{len(payload)}:{list(payload)}".encode("ascii")


def normalize_line(line):
    if line.endswith(b"\r\n"):
        return line[:-2]
    if line.endswith(b"\n"):
        return line[:-1]
    return line


class OutputReader:
    def __init__(self, stream, label):
        self.stream = stream
        self.label = label
        self.results = queue.Queue()
        self.thread = threading.Thread(target=self._read, daemon=True)
        self.thread.start()

    def _read(self):
        try:
            while True:
                line = self.stream.readline()
                if line == b"":
                    self.results.put(("eof", None))
                    return
                self.results.put(("line", normalize_line(line)))
        except Exception as error:  # Forward reader-thread failures to the main thread.
            self.results.put(("error", error))

    def read_line(self):
        try:
            kind, value = self.results.get(timeout=READ_TIMEOUT_SECONDS)
        except queue.Empty as error:
            raise AssertionError(f"stdin read timed out in {self.label!r} mode") from error

        if kind == "line":
            return value
        if kind == "error":
            raise AssertionError(f"failed to read child stdout: {value}")
        raise AssertionError(f"child closed stdout in {self.label!r} mode")

    def expect_quiet(self):
        try:
            kind, value = self.results.get(timeout=QUIET_WAIT_SECONDS)
        except queue.Empty:
            return
        raise AssertionError(
            f"stdin read returned before data was available in {self.label!r} mode: "
            f"{kind} {value!r}"
        )

    def join(self):
        self.thread.join(timeout=CLEANUP_TIMEOUT_SECONDS)

    def is_alive(self):
        return self.thread.is_alive()


def parse_read(line):
    try:
        count_text, values_text = line.decode("ascii").split(":", 1)
        count = int(count_text)
        values = ast.literal_eval(values_text)
    except (UnicodeDecodeError, ValueError, SyntaxError) as error:
        raise AssertionError(f"invalid read result: {line!r}") from error

    if not isinstance(values, list) or any(
        not isinstance(value, int) or value < 0 or value > 255 for value in values
    ):
        raise AssertionError(f"invalid byte array in read result: {line!r}")
    if count != len(values):
        raise AssertionError(
            f"reported byte count {count} does not match {len(values)} values"
        )
    return bytes(values)


def assert_exact_lines(actual_lines, expected_lines, label):
    if actual_lines != expected_lines:
        raise AssertionError(
            f"unexpected child output in {label!r} mode: "
            f"expected {expected_lines!r}, got {actual_lines!r}"
        )


def assert_short_read(actual_lines, payload, capacity, label):
    if len(actual_lines) != 1:
        raise AssertionError(f"expected one output line in {label!r} mode")
    data = parse_read(actual_lines[0])
    if not data or len(data) >= capacity:
        raise AssertionError(
            f"expected a non-empty short read below {capacity} bytes, got {len(data)}"
        )
    if data != payload[: len(data)]:
        raise AssertionError(
            f"read bytes are not an input prefix in {label!r} mode: {data!r}"
        )


def start_process(command, mode, stdin):
    environment = os.environ.copy()
    environment["CJ_STDIN_PARTIAL_READ_MODE"] = mode
    return subprocess.Popen(
        command,
        stdin=stdin,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        env=environment,
    )


def stop_process(process):
    if process.poll() is not None:
        return
    try:
        process.terminate()
        process.wait(timeout=CLEANUP_TIMEOUT_SECONDS)
    except OSError:
        if process.poll() is None:
            raise
    except subprocess.TimeoutExpired:
        try:
            process.kill()
            process.wait(timeout=CLEANUP_TIMEOUT_SECONDS)
        except OSError:
            if process.poll() is None:
                raise
        except subprocess.TimeoutExpired as error:
            raise AssertionError("failed to stop child process") from error


def read_stderr(process):
    if process.stderr is None:
        return ""
    return process.stderr.read().decode("utf-8", errors="replace")


def wait_for_success(process, label):
    try:
        process.wait(timeout=READ_TIMEOUT_SECONDS)
    except subprocess.TimeoutExpired as error:
        raise AssertionError(f"child did not exit in {label!r} mode") from error
    if process.returncode != 0:
        raise AssertionError(
            f"child exited with {process.returncode} in {label!r} mode: "
            f"{read_stderr(process)}"
        )


def cleanup_process(process, reader):
    if process.stdin is not None and not process.stdin.closed:
        try:
            process.stdin.close()
        except OSError:
            pass
    stop_process(process)
    if reader is not None:
        reader.join()
    if process.stdout is not None:
        process.stdout.close()
    if reader is not None and reader.is_alive():
        reader.join()
        if reader.is_alive():
            raise AssertionError("failed to stop child stdout reader")
    if process.stderr is not None:
        process.stderr.close()


def run_pipe_case(
    command,
    payload,
    line_count,
    check,
    *,
    mode="partial",
    close_stdin_before_read=False,
):
    process = start_process(command, mode, subprocess.PIPE)
    reader = OutputReader(process.stdout, mode)
    try:
        if payload:
            process.stdin.write(payload)
            process.stdin.flush()
        if close_stdin_before_read:
            process.stdin.close()

        lines = [reader.read_line() for _ in range(line_count)]
        check(lines)

        if process.stdin is not None and not process.stdin.closed:
            process.stdin.close()
        wait_for_success(process, mode)
    finally:
        cleanup_process(process, reader)


def run_delayed_case(command):
    mode = "delayed"
    payload = b"late data"
    process = start_process(command, mode, subprocess.PIPE)
    reader = OutputReader(process.stdout, mode)
    try:
        assert_exact_lines([reader.read_line()], [b"READY"], mode)
        reader.expect_quiet()
        if process.poll() is not None:
            raise AssertionError("child exited before delayed stdin data was written")

        process.stdin.write(payload)
        process.stdin.flush()
        assert_short_read([reader.read_line()], payload, 4096, mode)
        process.stdin.close()
        wait_for_success(process, mode)
    finally:
        cleanup_process(process, reader)


def run_file_case(command):
    mode = "file"
    payload = b"file\r\nredirected\x00data"
    with tempfile.TemporaryFile() as input_file:
        input_file.write(payload)
        input_file.seek(0)
        process = start_process(command, mode, input_file)
        reader = OutputReader(process.stdout, mode)
        try:
            assert_short_read([reader.read_line()], payload, 4096, mode)
            wait_for_success(process, mode)
        finally:
            cleanup_process(process, reader)


def run_pty_case(command):
    if os.name != "posix":
        return

    import pty  # Only available on POSIX hosts.

    mode = "pty"
    payload = b"pty input\n"
    master_fd, slave_fd = pty.openpty()
    process = None
    reader = None
    try:
        process = start_process(command, mode, slave_fd)
        os.close(slave_fd)
        slave_fd = -1
        reader = OutputReader(process.stdout, mode)
        os.write(master_fd, payload)
        assert_exact_lines([reader.read_line()], [format_read(payload)], mode)
        wait_for_success(process, mode)
    finally:
        if process is not None:
            cleanup_process(process, reader)
        if slave_fd >= 0:
            os.close(slave_fd)
        os.close(master_fd)


def main():
    try:
        separator = sys.argv.index("--")
    except ValueError as error:
        raise SystemExit(
            "usage: check_stdin_partial_read.py -- <command> [args...]"
        ) from error

    command = sys.argv[separator + 1 :]
    if not command:
        raise SystemExit("missing executable command")

    for label, payload in (
        ("newline", b"test data\n"),
        ("no_newline", b"test data"),
        ("embedded_newline", b"left\nright"),
    ):
        run_pipe_case(
            command,
            payload,
            1,
            lambda lines, data=payload, case=label: assert_short_read(
                lines, data, 4096, case
            ),
            mode=label,
        )

    run_delayed_case(command)
    run_pipe_case(
        command,
        b"abcdef",
        2,
        lambda lines: assert_exact_lines(
            lines, [format_read(b"abcd"), format_read(b"ef")], "small"
        ),
        mode="small",
    )
    run_pipe_case(
        command,
        b"abcdef\n",
        2,
        lambda lines: assert_exact_lines(
            lines, [b"Some(a)", format_read(b"bcdef\n")], "buffered"
        ),
        mode="buffered",
    )
    run_pipe_case(
        command,
        b"first\nsecond",
        2,
        lambda lines: assert_exact_lines(
            lines, [b"Some(first)", format_read(b"second")], "mixed"
        ),
        mode="mixed",
    )
    run_pipe_case(
        command,
        b"first\r\nsecond",
        2,
        lambda lines: assert_exact_lines(
            lines, [b"Some(first)", format_read(b"second")], "mixed_crlf"
        ),
        mode="mixed",
    )

    mixed_payload = b"abcdef\nTAIL"
    run_pipe_case(
        command,
        mixed_payload,
        3,
        lambda lines: assert_exact_lines(
            lines,
            [format_read(b"ab"), b"Some(cdef)", format_read(b"TAIL")],
            "reverse_mixed",
        ),
        mode="reverse_mixed",
    )
    run_pipe_case(
        command,
        mixed_payload,
        3,
        lambda lines: assert_exact_lines(
            lines,
            [format_read(b"ab"), b"cdef", format_read(b"TAIL")],
            "core_mixed",
        ),
        mode="core_mixed",
    )

    long_line = b"a" * 600
    run_pipe_case(
        command,
        long_line + b"\nTAIL",
        2,
        lambda lines: assert_exact_lines(
            lines, [b"Some(" + long_line + b")", format_read(b"TAIL")], "long_line"
        ),
        mode="mixed",
    )
    run_pipe_case(
        command,
        bytes((0x00, 0x1A, 0x80, 0xFF)),
        1,
        lambda lines: assert_exact_lines(
            lines, [format_read(bytes((0x00, 0x1A, 0x80, 0xFF)))], "binary"
        ),
        mode="binary",
    )
    run_pipe_case(
        command,
        b"",
        1,
        lambda lines: assert_exact_lines(lines, [format_read(b"")], "empty"),
        mode="empty",
    )
    run_pipe_case(
        command,
        b"",
        1,
        lambda lines: assert_exact_lines(lines, [format_read(b"")], "eof"),
        mode="eof",
        close_stdin_before_read=True,
    )
    run_file_case(command)
    run_pty_case(command)
    print("PASS")


if __name__ == "__main__":
    main()
