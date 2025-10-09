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
import re
import logging
from glob import glob

log_filename = 'run_ios.log'
if os.path.exists(log_filename):
    os.remove(log_filename)
logging.basicConfig(
    filename=log_filename,
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    encoding='utf-8'
)

def exit_with_unexpected_error(msg):
    logging.error(msg)
    sys.exit(139)

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
    try:
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
    except subprocess.CalledProcessError as e:
        raise Exception(f"Failed to start simulator: {str(e)}")
 
def find_app_path(derived_data, configuration, is_simulator):
    platform = "iphonesimulator" if is_simulator else "iphoneos"
    build_dir = os.path.join(derived_data, "Build", "Products", f"{configuration}-{platform}")
    apps = glob(os.path.join(build_dir, "*.app"))
    if not apps:
        raise Exception("Error: No .app file found in build directory.")
    return apps[0]
 
def uninstall_app(device_type, udid, bundle_id):
    try:
        if device_type == "simulator":
            run_cmd(['xcrun', 'simctl', 'uninstall', udid, bundle_id])
        else:
            run_cmd(['ideviceinstaller', '-u', udid, '-U', bundle_id])
        print_log(f"Successfully uninstalled {bundle_id}")
    except subprocess.CalledProcessError as e:
        raise Exception(f"Uninstall failed: {str(e)}")
 
def print_log(str):
    if IS_DEBUG:
        print(str)
 
def check_output(command):
    print_log(f'command: {command}')
    return subprocess.check_output(command, text=True)
 
def run_cmd(command):
    print_log(f'command: {command}')
    subprocess.run(command, check=True, stdout=None if IS_DEBUG else subprocess.PIPE, stderr=None if IS_DEBUG else subprocess.PIPE)

def run_cmd_with_log(command):
    command_string = " ".join(command)
    logging.info("Run command: '{}'".format(command_string))
    result = subprocess.run(command, capture_output=True, text=True)
    logging.info("Return code {} by command '{}'".format(result.returncode, command_string))
    logging.info("command '{}' generates stdout message: >>> '''\n{}'''".format(command_string, result.stdout))
    logging.info("command '{}' generates stderr message: >>> '''\n{}'''".format(command_string, result.stderr))
    return result

def run_app(command):
    print_log(f'command: {command}')
    try:
        process = subprocess.Popen(
            command,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        )
        com_out, com_err = process.communicate()
        com_out = com_out.decode("utf-8", errors="ignore")
        com_err = com_err.decode("utf-8", errors="ignore")
        return process.returncode, com_out, com_err
    finally:
        process.terminate()
 
def main():
    try:
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
        parser.add_argument("--build-output", default="./build_output", help="Path of the build output")
        parser.add_argument("--clean", action="store_true", help="Clean before building")
        parser.add_argument("--uninstall", action="store_true", help="Uninstall app after running")
        parser.add_argument("--temporary-product-directory", required=True, help="as the name describes")
        parser.add_argument("--export-option-plist-path", required=True, help="as the name describes")
        parser.add_argument("--ios-device-mount-path", required=True, help="as the name describes")
        parser.add_argument("--environment-file", required=True, help="text based environment file")
        args = parser.parse_args()
        global IS_DEBUG
        IS_DEBUG = True if args.configuration == "Debug" else False
 
        # Validation
        if args.device_type == "simulator" and not args.udid and (not args.simulator_name or not args.os_version):
            parser.error("For simulator, either provide --udid or both --simulator-name and --os-version")
        if args.device_type == "device" and not args.udid:
            parser.error("--udid is required for device")
 
        # Check tools
        check_tool_exists("xcodebuild")
        check_tool_exists("xcrun")
        if args.device_type == "device":
            check_tool_exists("ifuse")
 
        # Handle simulator
        udid = args.udid
        if args.device_type == "simulator":
            if not udid:
                udid = find_simulator_udid(args.simulator_name, args.os_version)
            else:
                validate_simulator_udid(udid)
            check_and_start_simulator(udid)
 
        # Build parameters
        derived_data = os.path.abspath(args.build_output)
        is_workspace = args.project_path.endswith(".xcworkspace")
 
        # Build
        build_cmd = ["xcodebuild", "-project", args.project_path, "-scheme", args.scheme, "-destination", "platform=iOS,id=" + args.udid, "-derivedDataPath", args.temporary_product_directory + "/build", "build"]
        result = run_cmd_with_log(build_cmd)
        if result.returncode != 0:
            exit_with_unexpected_error("Xcode project build failed!")
        logging.info("Building finished.")
        # Install and run
        try:
            # Install to device
            result = run_cmd_with_log(["xcrun", "devicectl", "device", "install", "app", "--device", args.udid, args.temporary_product_directory + "/build/Build/Products/Debug-iphoneos/" + args.scheme + ".app"])
            if result.returncode != 0:
                exit_with_unexpected_error("Errors occured while installing app on device!")

            env = '{}'
            if os.path.exists(args.environment_file):
                env = '{'
                with_comma = False
                with open(args.environment_file, 'r') as file:
                    for line in file:
                        def is_valid_json_string(s: str) -> bool:
                            try:
                                json.loads('"' + s + '"')
                                return True
                            except json.JSONDecodeError:
                                return False
                        i = line.index("=")
                        if i == None:
                            continue
                        if not is_valid_json_string(line[:-1]):
                            continue
                        if with_comma:
                            env += ", "
                        env += '"' + line[:i] + '": "' + line[(i + 1):-1] + '"'
                        with_comma = True
                env += '}'

            run_app_cmd = ["xcrun", "devicectl", "device", "process", "launch", "--device", args.udid, "-e", env, args.bundle_id]
            result = run_cmd_with_log(run_app_cmd)
            if result.returncode != 0:
                exit_with_unexpected_error("Application launch failed!")
            logging.info("Application launched.")

            run_cmd_with_log(["umount", args.ios_device_mount_path])
            result = run_cmd_with_log(["ifuse", args.ios_device_mount_path, "--documents", args.bundle_id])
            retry = 5
            while retry > 0 and result.returncode != 0:
                result = run_cmd_with_log(["ifuse", args.ios_device_mount_path, "--documents", args.bundle_id])
                retry -= 1
                time.sleep(1)
            if result.returncode != 0:
                exit_with_unexpected_error("Mount application sandbox directory failed!")
            while(True):
                content = None
                if os.path.exists(os.path.join(args.ios_device_mount_path, "console_out.txt")):
                    with open(os.path.join(args.ios_device_mount_path, "console_out.txt"), 'r', encoding='utf-8') as f:
                        content = f.read()
                if content and re.search(r"^cj_main_return_start.*cj_main_return_end$", content, re.MULTILINE):
                    break
                time.sleep(1)
            with open(os.path.join(args.ios_device_mount_path, "console_err.txt"), 'r', encoding='utf-8') as f:
                captured_std_err = f.read()
            logging.info("Full console_out.txt content: >>> '''\n{}'''".format(content))

            shutil.copytree(args.ios_device_mount_path, os.getcwd(), dirs_exist_ok=True)
            run_cmd_with_log(["umount", args.ios_device_mount_path])

            match = re.search(r"cj_main_return_start(.*)cj_main_return_end", content)
            if match:
                return_val = match.group(1)
                return_code = 0 if return_val == "()" else int(match.group(1))
            else:
                exit_with_unexpected_error("Unexpected program end state, return code not detected!")
            logging.info("The program exits with return code {}".format(return_code))

            captired_std_out = ""
            for line in content.splitlines():
                if line.startswith("cj_main_return_start"):
                    break
                captired_std_out += line + "\n"
            if len(captired_std_out) > 0 and captired_std_out[-1] == "\n":
                captired_std_out = captired_std_out[:-1]
            logging.info("Captured program stdout: >>> '''\n{}'''".format(captired_std_out))
            sys.stdout.write(captired_std_out)
            logging.info("Captured program stderr: >>> '''\n{}'''".format(captured_std_err))
            sys.stderr.write(captured_std_err)
            sys.exit(return_code)
        finally:
            if args.uninstall:
                uninstall_app(args.device_type, udid, args.bundle_id)
    except Exception as e:
        print(e)
        sys.exit(139)
 
if __name__ == "__main__":
    main()