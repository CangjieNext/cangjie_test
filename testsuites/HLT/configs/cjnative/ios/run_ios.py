#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import argparse
import subprocess
import sys
import json
import os
import shutil
import time
from glob import glob
import re
import traceback


def check_tool_exists(tool):
    if shutil.which(tool) is None:
        raise Exception(f"Error: Required tool '{tool}' not found. Please install it.")

def validate_simulator_udid(udid):
    try:
        output = check_output(['xcrun', 'simctl', 'list', 'devices', '--json'])
        data = json.loads(output)
        for runtime in data['devices']:
            for device in data['devices'][runtime]:
                if device['udid'] == udid and device['isAvailable']:
                    return True
        raise Exception(f"Error: Simulator with UDID {udid} not found or unavailable.")
    except Exception as e:
        raise Exception(f"Error validating simulator: {str(e)}")

def find_simulator_udid(simulator_name, os_version):
    try:
        output = check_output(['xcrun', 'simctl', 'list', '--json'])
        data = json.loads(output)
        
        target_runtime = None
        for runtime in data['runtimes']:
            if 'iOS' in runtime['name'] and os_version in runtime['version']:
                target_runtime = runtime['identifier']
                break
        
        if not target_runtime:
            raise Exception(f"Error: iOS {os_version} runtime not found.")
        
        for device in data['devices'].get(target_runtime, []):
            if device['name'] == simulator_name and device['isAvailable']:
                return device['udid']
        
        raise Exception(f"Error: No available simulator found with name '{simulator_name}' and iOS {os_version}.")
    except Exception as e:
        raise Exception(f"Error finding simulator: {str(e)}")

def check_and_start_simulator(udid):
    output = check_output(['xcrun', 'simctl', 'list', 'devices', udid, '--json'])
    data = json.loads(output)
    
    for runtime in data['devices']:
        for device in data['devices'][runtime]:
            if device['udid'] == udid:
                if device['state'] == 'Booted':
                    return True
                print_log(f"Starting simulator {udid}...")
                run_cmd(['xcrun', 'simctl', 'boot', udid])

                # Wait for boot completion
                start_time = time.time()
                while time.time() - start_time < 30:
                    output = check_output(['xcrun', 'simctl', 'list', 'devices', udid, '--json'])
                    status = json.loads(output)
                    current_state = status['devices'][runtime][0]['state']
                    if current_state == 'Booted':
                        return True
                    time.sleep(1)
                raise Exception("Error: Simulator failed to boot within 30 seconds.")
    raise Exception(f"Error: Simulator {udid} not found.")

def find_app_path(derived_data, configuration, is_simulator):
    platform = "iphonesimulator" if is_simulator else "iphoneos"
    build_dir = os.path.join(derived_data, "Build", "Products", f"{configuration}-{platform}")
    apps = glob(os.path.join(build_dir, "*.app"))
    if not apps:
        raise Exception("Error: No .app file found in build directory.")
    return apps[0]

def uninstall_app(device_type, udid, bundle_id):
    if device_type == "simulator":
        run_cmd(['xcrun', 'simctl', 'uninstall', udid, bundle_id])
    else:
        run_cmd(['ideviceinstaller', '-u', udid, '-U', bundle_id])
    print_log(f"Successfully uninstalled {bundle_id}")

def print_log(str):
    if IS_DEBUG:
        print(str)

def check_output(command):
    print_log(f'command: {command}')
    return subprocess.check_output(command, text=True)

def run_cmd(command):
    print_log(f'command: {command}')
    subprocess.run(command, check=True, capture_output=not IS_DEBUG, text=True)

def run_app(command):
    print_log(f'command: {command}')
    try:
        process = subprocess.Popen(
            command,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        )
        cmd_out, cmd_err = process.communicate()
        cmd_out = cmd_out.decode("utf-8", errors="ignore") if cmd_out else ""
        cmd_err = cmd_err.decode("utf-8", errors="ignore") if cmd_err else ""
        return process.returncode, cmd_out, cmd_err
    finally:
        process.terminate()

def main():
    parser = argparse.ArgumentParser(description="iOS Build & Run with Direct Console Output")
    parser.add_argument("--project-path", required=True, help="Path to .xcodeproj or .xcworkspace")
    parser.add_argument("--scheme", required=True, help="Build scheme name")
    parser.add_argument("--device-type", required=True, choices=["simulator", "device"], 
                    help="Target device type")
    parser.add_argument("--simulator-name", help="Simulator name (required if not using --udid for simulator)")
    parser.add_argument("--os-version", help="iOS version for simulator (required if not using --udid)")
    parser.add_argument("--udid", help="Device/simulator UDID")
    parser.add_argument("--bundle-id", required=True, help="App bundle identifier")
    parser.add_argument("--configuration", default="Debug", help="Build configuration")
    parser.add_argument("--workspace", default="./", help="Specify working directory")
    parser.add_argument("--clean", action="store_true", help="Clean before building")
    parser.add_argument("--uninstall", action="store_true", help="Uninstall app after running")
    parser.add_argument("--objcffi", action="store_true", help="objcffi test")
    args = parser.parse_args()
    global IS_DEBUG
    IS_DEBUG = args.configuration == "Debug"

    # Validation
    if args.device_type == "simulator" and not args.udid and (not args.simulator_name or not args.os_version):
        parser.error("For simulator, either provide --udid or both --simulator-name and --os-version")
    if args.device_type == "device" and not args.udid:
        parser.error("--udid is required for device")

    # Check tools
    check_tool_exists("xcodebuild")
    check_tool_exists("xcrun")
    if args.device_type == "device":
        check_tool_exists("ideviceinstaller")

    # Handle simulator
    udid = args.udid
    if args.device_type == "simulator":
        if not udid:
            udid = find_simulator_udid(args.simulator_name, args.os_version)
        else:
            validate_simulator_udid(udid)
        check_and_start_simulator(udid)

    # Build parameters
    workspace = os.path.abspath(args.workspace)
    derived_data = os.path.join(workspace, "build_output")
    is_workspace = args.project_path.endswith(".xcworkspace")

    # Build
    build_cmd = ["xcodebuild"]
    if args.clean:
        build_cmd.append("clean")
    build_cmd += [
        "build",
        "-scheme", args.scheme,
        "-configuration", args.configuration,
        "-derivedDataPath", derived_data
    ]
    if is_workspace:
        build_cmd += ["-workspace", args.project_path]
    else:
        build_cmd += ["-project", args.project_path]
    build_cmd += ["-destination", f"id={udid}"] if args.device_type == "simulator" else ["-destination", f"platform=iOS,id={args.udid}"]
    build_cmd += ["LD_RUNPATH_SEARCH_PATHS='@executable_path/Frameworks'"]
    run_cmd(build_cmd)

    # Install and run
    is_simulator = args.device_type == "simulator"
    app_path = find_app_path(derived_data, args.configuration, is_simulator)
    
    if is_simulator:
        # Install to simulator
        run_cmd(["xcrun", "simctl", "install", udid, app_path])
        
        # The cmd with console output
        run_app_cmd = [
            "xcrun", "simctl", "launch", "--console-pty", "--terminate-running-process",
            udid, args.bundle_id, "--workspace", workspace
        ]
    else:
        # Install to device
        run_cmd(["ideviceinstaller", "-u", args.udid, "-i", app_path])
        
        # Run with syslog output
        run_app_cmd = [
            "idevicedebug", "-u", args.udid, "run", args.bundle_id
        ]
    # Run App
    com_out = ""
    com_err = ""
    try:
        return_code, com_out, com_err = run_app(run_app_cmd)
        if return_code != 0:
            raise Exception(f"Failed to run app: '{run_app_cmd}', return code: {return_code}!")
        com_out = com_out.replace('\r\n', '\n').replace('\r', '\n')
        com_err = com_err.replace('\r\n', '\n').replace('\r', '\n')
        if not args.objcffi:
            if "cj_main_return_start" in com_out and "cj_main_return_end" in com_out:
                com_out=re.sub(rf"{args.bundle_id}: [0-9]+\n?", "", com_out)
                return_code = int(com_out.split("cj_main_return_start")[1].split("cj_main_return_end")[0])
                com_out = com_out.split("cj_main_return_start")[0] + com_out.split("cj_main_return_end")[1]
            else:
                raise Exception(f"Error: The 'cj_main_return_start' and 'cj_main_return_end' were not found, please check cangjie main function!")
        sys.exit(return_code)
    finally:
        sys.stdout.write(com_out)
        sys.stderr.write(com_err)
        if args.uninstall:
            uninstall_app(args.device_type, udid, args.bundle_id)

if __name__ == "__main__":
    try:
        try:
            main()
        except subprocess.CalledProcessError as e:
            sys.stdout.write(e.stdout if e.stdout else "")
            sys.stderr.write(e.stderr if e.stderr else "")
            raise
    except SystemExit:
        raise
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        print("Traceback (most recent call last):", file=sys.stderr)
        traceback.print_tb(exc_traceback, file=sys.stderr)
        print(f"{exc_type.__name__}: {exc_value}", file=sys.stderr)
        sys.exit(255)
