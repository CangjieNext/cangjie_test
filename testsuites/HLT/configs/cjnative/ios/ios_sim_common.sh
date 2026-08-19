#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#
# iOS 模拟器直接可执行文件路线的公共工具函数。
# 供各 run 脚本 source 使用，避免重复代码。
# 依赖环境变量：CANGJIE_HOME

# 检查 CANGJIE_HOME
require_cangjie_home() {
    if [ -z "${CANGJIE_HOME}" ]; then
        echo "Error: CANGJIE_HOME is not set" >&2
        return 255
    fi
    return 0
}

# 返回模拟器运行时库目录（按架构选择）
ios_runtime_lib_dir() {
    local arch="${1:-arm64}"
    if [ "$arch" = "x86_64" ]; then
        echo "${CANGJIE_HOME}/runtime/lib/ios_simulator_x86_64_cjnative"
    else
        echo "${CANGJIE_HOME}/runtime/lib/ios_simulator_aarch64_cjnative"
    fi
}

# ad-hoc 签名可执行文件，否则 simctl spawn 报 Security policy issue (163)
sign_executable() {
    local exe="$1"
    [ -z "$exe" ] && return 255
    codesign -f -s - "$exe"
}

# 单个文件若是 Mach-O 动态库则做 ad-hoc 签名。
# 按文件类型(而非后缀名)判断，兼容名为 *.a 的实际 dylib。
sign_macho_dylib() {
    local f="$1"
    [ -e "$f" ] || return 0
    if file -b "$f" | grep -qE "Mach-O.*(dylib|dynamically linked shared library)"; then
        codesign -f -s - "$f" 2>/dev/null
    fi
}

# 给指定目录下所有 Mach-O 动态库做 ad-hoc 签名，
# 否则模拟器报 "Trying to load an unsigned library"。
sign_dylibs_in_dir() {
    local dir="$1"
    if [ -n "$dir" ] && [ -d "$dir" ]; then
        for d in "$dir"/*; do
            sign_macho_dylib "$d"
        done
    fi
}

# 给模拟器运行时目录下所有 Mach-O 动态库签名
sign_runtime_dylibs() {
    sign_dylibs_in_dir "$1"
}

# 输出一个可用的模拟器 udid：优先环境变量，其次当前 booted 的模拟器
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

# 在模拟器上运行可执行文件，动态链接时注入运行时库目录
# 用法: run_on_simulator <udid> <exe> [args...]
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