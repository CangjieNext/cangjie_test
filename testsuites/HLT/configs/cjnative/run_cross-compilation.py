#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import argparse
import logging
import os
import platform
import time
import subprocess
import sys
from collections import OrderedDict
from pathlib import Path
from textwrap import indent

sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))

PREPARE_STAGE = ["copy_file_to_remote"]
RUN_STAGE = ["run_case"]
DOWNLOAD_STAGE = ["download_file_from_remote"]
REMOVE_STAGE = ["remove_file_on_remote"]

STAGES = (PREPARE_STAGE, RUN_STAGE, DOWNLOAD_STAGE, REMOVE_STAGE)

EXIT_CODE = 0
# ENCODING = locale.getpreferredencoding(False)
ENCODING = "utf-8"

IS_WINDOWS = platform.system() == "Windows"

tool = "hdc"


class RunError(Exception):
    pass


def complete_path(path):
    """Returns the canonical path of a path"""
    path = Path(path)
    if not path.exists():
        return Path(os.path.realpath(str(path)))
    return path.expanduser().resolve()


def add_run_path(new_path):
    """Add path to PATH"""
    run_env = os.environ.copy()
    old_path = run_env.get("PATH")
    if old_path:
        if sys.platform == 'linux' or sys.platform == 'darwin':
            run_env["PATH"] = old_path + ":" + new_path
        else:
            run_env["PATH"] = old_path + ";" + new_path
    else:
        run_env["PATH"] = new_path
    return run_env


def run(cmd, work_dir, timeout):
    process = subprocess.Popen(
        cmd,
        shell=True,
        close_fds=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        cwd=str(work_dir),
        env=add_run_path(str(work_dir)),
    )
    try:
        comout, comerr = process.communicate(timeout=timeout)
    except subprocess.CalledProcessError as e:
        raise e
    else:
        returncode = process.returncode
        comout = comout.decode(ENCODING, errors="ignore")
        comerr = comerr.decode(ENCODING, errors="ignore")
        return returncode, comout, comerr
    finally:
        process.terminate()


def construct_tool_shell_cmd(cmd):
    if IS_WINDOWS:
        symbol = '\"'
    else:
        symbol = '\''
    cmd = "{tool} shell {symbol}{cmd1} 2>/dev/null; echo code_start$?err_start;{cmd2} 1>/dev/null;{symbol}".format(
        tool=tool,
        symbol=symbol,
        cmd1=cmd,
        cmd2=cmd,
    )
    return cmd


def construct_tool_send_cmd(src, dest):
    if "hdc" in tool:
        cmd = "{tool} file send {src} {dest}".format(
            tool=tool,
            src=str(src).strip(),
            dest=str(dest).strip(),
        )
    elif "adb" in tool:
        if IS_WINDOWS:
            bash_src=str(src).strip().replace("\\", "/")
            cmd = r"bash -c 'find {bash_src} -name \"*.c\" -exec rm -rf {{}} \;' && {tool} push {src} {dest}".format(
                tool=tool,
                src=str(src).strip(),
                bash_src=bash_src,
                dest=str(dest).strip(),
            )
        else:
            cmd = "{tool} push {src} {dest}".format(
                tool=tool,
                src=str(src).strip(),
                dest=str(dest).strip(),
            )
    else:
        cmd = ""
    return cmd


def construct_remote_cmd(execute_cmd, execute_case_cmd, upload_file, remote_temp_dir):
    remote_path = "/data/local/tmp/run/"
    remote_temp_dir = remote_path + remote_temp_dir
    cmd_temp = execute_case_cmd.split(" ")
    execute_case_cmd = " ".join(cmd_temp)
    run_case_cmd = (
        "cd {path}; chmod -R +x {path}; export PATH=$(pwd):$PATH; export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH && "
        "{execute_case_cmd}".format(path=remote_temp_dir, execute_case_cmd=execute_case_cmd)
    )
    execute_cmd["run_case"] = construct_tool_shell_cmd(run_case_cmd)

    execute_cmd["copy_file_to_remote"] = [
        construct_tool_send_cmd(upload_file, remote_temp_dir)
    ]
    remove_case_cmd = (
        "rm -rf {}".format(remote_temp_dir)
    )
    execute_cmd["remove_file_on_remote"] = construct_tool_shell_cmd(remove_case_cmd)


def parse_cli():
    parser = argparse.ArgumentParser(prog="run")

    parser.add_argument(
        "--timeout",
        type=float,
        default=None,
        help="run test case timeout",
    )
    parser.add_argument(
        "-d",
        "--device",
        type=str,
        default=None,
        help="the target device for hdc commands",
    )
    parser.add_argument(
        "-t",
        "--tool",
        type=str,
        default="hdc",
        help="the tool for commands",
    )

    parser.add_argument(
        "execute_cmd",
        nargs=argparse.ONE_OR_MORE,
        metavar="command",
        help="execute command"
    )

    connection_options = parser.add_argument_group("Script options")
    connection_options.add_argument(
        "--verbose",
        action="store_true",
        dest="verbose",
        help="enable verbose output",
    )

    opts = parser.parse_args()
    return opts


def run_case(execute_cmd, work_dir, timeout):
    global EXIT_CODE
    try:
        for stage, value in execute_cmd.items():
            if stage == "remove_file_on_remote":
                continue
            if isinstance(value, str):
                run_cmd(stage, value, work_dir, timeout)
            elif isinstance(value, list):
                for cmd in value:
                    run_cmd(stage, cmd, work_dir, timeout)
    except Exception as e:
        raise RunError(str(e))
    finally:
        if "remove_file_on_remote" in execute_cmd and execute_cmd["remove_file_on_remote"]:
            try:
                logging.info("Cleaning up remote files...")
                cleanup_cmd = execute_cmd["remove_file_on_remote"]
                run_cmd("remove_file_on_remote", cleanup_cmd, work_dir, timeout)
            except Exception as cleanup_error:
                logging.warning("Cleanup failed but continuing: %s", cleanup_error)


def run_cmd(stage, cmd, work_dir, timeout):
    return_code, com_out, com_err = run(cmd, work_dir, timeout)
    time.sleep(2)
    if "adb" in tool:
        com_out = com_out.replace('\r\n', '\n')
        com_err = com_err.replace('\r\n', '\n')
        if "code_start" in com_out and "err_start\n" in com_out:
            com_out = (com_out.split("code_start")[0] + com_out.split("err_start\n")[1])
        elif "code_start" in com_out and "err_start" in com_out:
            com_out = (com_out.split("code_start")[0] + com_out.split("err_start")[1])
        if "code_start" in com_err and "err_start\n" in com_err:
            com_err = (com_err.split("code_start")[0] + com_err.split("err_start\n")[1])
        elif "code_start" in com_err and "err_start" in com_err:
            com_err = (com_err.split("code_start")[0] + com_err.split("err_start")[1])
    elif "code_start" in com_out:
        return_code = com_out.split("code_start")[1].split("err_start")[0]
        com_err = com_out.split("err_start")[1].replace('\r\n', '\n')
        com_out = com_out.split("code_start")[0].replace('\r\n', '\n')
    return_code = str(return_code)
    log_output = logging.debug
    if return_code != "0":
        log_output = logging.error
    if stage == "run_case":
        sys.stdout.write(com_out)
        sys.stderr.write(com_err)
    log_output("execute stage: %s", stage)
    log_output("execute command: %s", cmd)
    log_output("execute return code: %s", return_code)
    log_output("execute out: \n%s", indent(com_out, "\t", lambda line: True))
    log_output("execute error: \n%s", indent(com_err, "\t", lambda line: True))
    global EXIT_CODE
    if stage != "remove_file_on_remote":
        EXIT_CODE = int(return_code)
    if return_code != "0" and stage != "remove_file_on_remote":
        reason = "Run stage: {} failed at command: {}, reason: {}".format(
            stage.upper(), cmd, com_err
        )
        raise RunError(reason)


def main():
    global tool
    opts = parse_cli()
    timeout = opts.timeout
    execute_cmd = " ".join(opts.execute_cmd)
    execute_cmd = execute_cmd.replace("\\", "/")
    tool = opts.tool
    if opts.device is not None:
        if tool == "hdc":
            tool += " -t {}".format(opts.device)
        elif tool == "adb":
            tool += " -s {}".format(opts.device)
    logging.basicConfig(
        format="\t%(asctime)s %(message)s",
        datefmt="%H:%M:%S",
        level=logging.DEBUG if opts.verbose else logging.INFO,
        stream=sys.stderr,
    )

    execute_stages = OrderedDict()
    for stage in STAGES:
        for cmd in stage:
            execute_stages[cmd] = None

    local_path = os.getcwd()
    remote_path = os.path.basename(local_path)

    construct_remote_cmd(
        execute_stages,
        execute_cmd,
        local_path,
        remote_path,
    )
    check_case = construct_tool_shell_cmd("ls /data/local/tmp/run/" + remote_path)
    return_code, com_out, com_err = run(check_case, ".", 10)
    if "No such file or directory" not in com_out and "No such file or directory" not in com_err:
        execute_stages["copy_file_to_remote"] = None
    run_case(execute_stages, ".", timeout)


if __name__ == "__main__":
    try:
        main()
    except RunError as e:
        sys.exit(EXIT_CODE)
