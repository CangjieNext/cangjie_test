#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#


require_cangjie_home() {
    if [ -z "${CANGJIE_HOME}" ]; then
        echo "Error: CANGJIE_HOME is not set" >&2
        return 255
    fi
    return 0
}


ios_runtime_lib_dir() {
    local arch="${1:-arm64}"
    if [ "$arch" = "x86_64" ]; then
        echo "${CANGJIE_HOME}/runtime/lib/ios_simulator_x86_64_cjnative"
    else
        echo "${CANGJIE_HOME}/runtime/lib/ios_simulator_aarch64_cjnative"
    fi
}


sign_executable() {
    local exe="$1"
    [ -z "$exe" ] && return 255
    codesign -f -s - "$exe"
}


sign_macho_dylib() {
    local f="$1"
    [ -e "$f" ] || return 0
    if file -b "$f" | grep -qE "Mach-O.*(dylib|dynamically linked shared library)"; then
        codesign -f -s - "$f" 2>/dev/null
    fi
}


sign_dylibs_in_dir() {
    local dir="$1"
    if [ -n "$dir" ] && [ -d "$dir" ]; then
        for d in "$dir"/*; do
            sign_macho_dylib "$d"
        done
    fi
}


sign_runtime_dylibs() {
    sign_dylibs_in_dir "$1"
}


get_simulator_udid() {
    local udid="${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST}"
    if [ -z "$udid" ]; then
        udid=$(xcrun simctl list devices booted -j 2>/dev/null |
            /usr/bin/python3 -c "import sys,json;d=json.load(sys.stdin);print(next((dev['udid'] for rt in d['devices'].values() for dev in rt if dev.get('state')=='Booted'),''))" 2>/dev/null)
    fi
    if [ -z "$udid" ]; then
        echo "Error: no booted simulator, set XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST or boot a simulator" >&2
        return 255
    fi
    echo "$udid"
}


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

# export CANGJIE_TEST=/Users/cangjie_shanghai/cangjie/cangjie_test
# python3 main.py  --test_cfg=../cangjie_test/testsuites/HLT/configs/cjnative/mac_aarch64-ios_simulator_aarch64_exe/basic.cfg --test_list=../cangjie_test/testsuites/HLT/testlist