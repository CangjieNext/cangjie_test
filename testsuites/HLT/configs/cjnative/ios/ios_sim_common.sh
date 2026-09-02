#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#
# Common utility functions for the iOS simulator direct-executable route.
# Sourced by each run script to avoid duplicated code.
# Depends on the environment variable: CANGJIE_HOME

 
# Check CANGJIE_HOME
require_cangjie_home() {
    if [ -z "${CANGJIE_HOME}" ]; then
        echo "Error: CANGJIE_HOME is not set" >&2
        return 255
    fi
    return 0
}
 
# Return the simulator runtime library directory (selected by architecture)
ios_runtime_lib_dir() {
    local arch="${1:-arm64}"
    if [ "$arch" = "x86_64" ]; then
        echo "${CANGJIE_HOME}/runtime/lib/ios_simulator_x86_64_cjnative"
    else
        echo "${CANGJIE_HOME}/runtime/lib/ios_simulator_aarch64_cjnative"
    fi
}
 
# Ad-hoc sign the executable, otherwise simctl spawn reports Security policy issue (163)
sign_executable() {
    local exe="$1"
    [ -z "$exe" ] && return 255
    codesign -f -s - "$exe"
}
 
# Ad-hoc sign a single file if it is a Mach-O dynamic library.
# Detect by file type (not extension), so actual dylibs named *.a are also handled.
sign_macho_dylib() {
    local f="$1"
    [ -e "$f" ] || return 0
    if file -b "$f" | grep -qE "Mach-O.*(dylib|dynamically linked shared library)"; then
        codesign -f -s - "$f" 2>/dev/null
    fi
}
 
# Ad-hoc sign all Mach-O dynamic libraries under the given directory,
# otherwise the simulator reports "Trying to load an unsigned library".
sign_dylibs_in_dir() {
    local dir="$1"
    if [ -n "$dir" ] && [ -d "$dir" ]; then
        for d in "$dir"/*; do
            sign_macho_dylib "$d"
        done
    fi
}
 

 
# Output a usable simulator udid: prefer the environment variable, otherwise the currently booted simulator
get_simulator_udid() {
    local udid="${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST}"
    if [ -z "$udid" ]; then
        udid=$(xcrun simctl list devices booted -j 2>/dev/null |
            python3 -c "import sys,json;d=json.load(sys.stdin);print(next((dev['udid'] for rt in d['devices'].values() for dev in rt if dev.get('state')=='Booted'),''))" 2>/dev/null)
                fi
    if [ -z "$udid" ]; then
        echo "Error: no booted simulator, set XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST or boot a simulator" >&2
        return 255
    fi
    echo "$udid"
}
 
# Run an executable on the simulator, injecting the runtime library directory for dynamic linking.
# Usage: run_on_simulator <udid> <exe> [args...]
run_on_simulator() {
    local udid="$1"
    local exe="$2"
    shift 2
    local lib_dir
    lib_dir=$(ios_runtime_lib_dir)
    echo "running './$exe' on simulator $udid"
    SIMCTL_CHILD_DYLD_LIBRARY_PATH="$lib_dir" xcrun simctl spawn "$udid" "./$exe" "$@"
    return $?
}
 
