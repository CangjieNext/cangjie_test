#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#
# iOS 模拟器 exe 路线(免 xcodebuild)一站式入口：
#   1. 设置环境变量
#   2. boot 模拟器 / 确认 udid
#   3. 一次性签名共享运行时 dylib
#   4. 调用测试框架跑用例(自动用 mac_aarch64-ios_simulator_aarch64_exe/basic.cfg)
#
# 依赖环境变量(可提前设置):
#   CANGJIE_HOME/open ___必填___ cangjie SDK 路径
#   CANGJIE_TEST              必填 cangjie_test 仓路径
#   CANGJIE_TEST_FRAMEWORK    可选 测试框架路径, 默认 <CANGJIE_TEST 上级>/cangjie_test_framework
#   XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST 可选 指定模拟器 udid, 否则用 booted 的
#
# 用法:
#   bash run_ios_exe_testsuite.sh [用例路径或套件目录] [--test_list=<file>]
#   示例:
#   bash run_ios_exe_testsuite.sh ${CANGJIE_TEST}/testsuites/HLT/Runtime/cjnative
#   bash run_ios_exe_testsuite.sh ${CANGJIE_TEST}/testsuites/HLT/Runtime/cjnative --test_list=${CANGJIE_TEST}/testsuites/HLT/testlist

set -e

WORKSPACE=$(cd `dirname $0`; pwd)

if [ -z "${CANGJIE_HOME}" ]; then
    echo "Error: CANGJIE_HOME is not set" >&2
    exit 255
fi
if [ -z "${CANGJIE_TEST}" ]; then
    echo "Error: CANGJIE_TEST is not set" >&2
    exit 255
fi
if [ -z "${CANGJIE_TEST_FRAMEWORK}" ]; then
    CANGJIE_TEST_FRAMEWORK="$(dirname "$CANGJIE_TEST")/cangjie_test_framework"
fi

CFG="${CANGJIE_TEST}/testsuites/HLT/configs/cjnative/mac_aarch64-ios_simulator_aarch64_exe/basic.cfg"
RUN_CMD_ARGS=()

for arg in "$@"; do
    case "$arg" in
        --test_list=*) RUN_CMD_ARGS+=("$arg") ;;
        -*) RUN_CMD_ARGS+=("$arg") ;;
        *)
            # 相对路径转绝对路径
            case "$arg" in
                /*) TEST_PATH="$arg" ;;
                *) TEST_PATH="$(cd "$(dirname "$arg")" && pwd)/$(basename "$arg")" ;;
            esac
            ;;
    esac
done

# 1. 环境变量
export CANGJIE_HOME CANGJIE_TEST
export PATH="${CANGJIE_HOME}/bin:${CANGJIE_HOME}/tools/bin:${PATH}"
export DYLD_LIBRARY_PATH="${CANGJIE_HOME}/runtime/lib/darwin_aarch64_cjnative:${CANGJIE_HOME}/tools/lib:${DYLD_LIBRARY_PATH}"
export CANGJIE_LOCAL_STDX_PATH="${CANGJIE_HOME}/modules/ios_simulator_aarch64_cjnative"

# 2. 确认模拟器已 boot
source "${WORKSPACE}/ios_sim_common.sh"
UDID="$(get_simulator_udid)" || exit 255
export XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST="$UDID"
echo "simulator: $UDID"

# 3. 一次性签名共享运行时 dylib(跑全套用例前)
echo "signing runtime dylibs ..."
sign_runtime_dylibs "$(ios_runtime_lib_dir)"

# 4. 调用框架
if [ -z "$TEST_PATH" ]; then
    echo "Error: 请传入用例路径(文件或套件目录)" >&2
    exit 255
fi
echo "config     : $CFG"
echo "test path  : $TEST_PATH"
echo "framework  : $CANGJIE_TEST_FRAMEWORK"

cd "${CANGJIE_TEST_FRAMEWORK}"
python3 ./main.py --test_cfg="${CFG}" "${RUN_CMD_ARGS[@]}" "${TEST_PATH}"