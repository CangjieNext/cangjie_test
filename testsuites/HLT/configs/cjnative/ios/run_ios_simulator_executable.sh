#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#
# Direct-executable route: no xcodebuild / .app / C bridging.
# Prerequisite: the test case has been compiled into a simulator executable by
# cjc --output-type=exe (see the *_exe series cfg, where output = main, so the
# artifact in the working directory always has the fixed name ./main).
#
# The framework runs in work_dir, $1 looks like "%run %output %run_args",
# which expands to "export ... && main <args>". This script extracts the
# executable main, performs codesign -> simctl spawn, and returns the exit
# code to the framework.
 
set +x
set -e
 
WORKSPACE=$(cd `dirname $0`; pwd)
 
# Source the common utility functions
source "$WORKSPACE/ios_sim_common.sh"
 
require_cangjie_home


# Extract the executable name and arguments from $1
# Example of $1: "export DYLD_LIBRARY_PATH=... && main arg1 arg2"
RUN_CMD="$1"
# Take the part after "&&" as the actual run command
ACTUAL="${RUN_CMD##*&&}"
ACTUAL="${ACTUAL## }"
EXE="$(echo "$ACTUAL" | awk '{print $1}')"
EXE="${EXE#./}"
ARGS="$(echo "$ACTUAL" | awk '{$1=""; print $0}' | sed 's/^ *//')"
 
if [ -z "$EXE" ] || [ ! -f "$EXE" ]; then
    echo "Error: cannot find executable '$EXE' in $(pwd)"
    exit 255
fi
 
# Sign the executable
sign_executable "$EXE"
 
# Sign the dynamic libraries in the current working directory (custom libraries such as p1.a linked via the DYLD path).
# Note: the shared runtime dylibs are no longer signed here; they are signed once before running the full test suite
# (see ios_sign_runtime.sh), avoiding races from concurrent codesign across multiple processes.
sign_dylibs_in_dir "$(pwd)"
 
# Find the simulator
UDID="$(get_simulator_udid)"
 
# Run
run_on_simulator "$UDID" "$EXE" $ARGS
