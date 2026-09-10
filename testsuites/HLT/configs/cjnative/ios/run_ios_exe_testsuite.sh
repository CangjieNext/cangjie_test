#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#
# One-stop entry point for the iOS simulator direct-executable route (no xcodebuild):
#   1. Set environment variables
#   2. Boot the simulator / confirm the udid
#   3. Ad-hoc sign the shared runtime dylibs once
#   4. Invoke the test framework to run the test cases (automatically using
#      mac_aarch64-ios_simulator_aarch64_exe/basic.cfg)
#
# Depends on environment variables (can be set in advance):
#   CANGJIE_HOME/open ___Required___ cangjie SDK path
#   CANGJIE_TEST              Required  cangjie_test repo path
#   CANGJIE_TEST_FRAMEWORK    Optional  test framework path, defaults to <parent of CANGJIE_TEST>/cangjie_test_framework
#   XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST Optional  specify a simulator udid, otherwise use the booted one
#
# Usage:
#   bash run_ios_exe_testsuite.sh [test case path or suite directory] [--test_list=<file>]
#   Examples:
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
            # Convert a relative path to an absolute path
            case "$arg" in
                /*) TEST_PATH="$arg" ;;
                *) TEST_PATH="$(cd "$(dirname "$arg")" && pwd)/$(basename "$arg")" ;;
            esac
            ;;
    esac
done
 
# 1. Environment variables
export CANGJIE_HOME CANGJIE_TEST
export PATH="${CANGJIE_HOME}/bin:${CANGJIE_HOME}/tools/bin:${PATH}"
export DYLD_LIBRARY_PATH="${CANGJIE_HOME}/runtime/lib/darwin_aarch64_cjnative:${CANGJIE_HOME}/tools/lib:${DYLD_LIBRARY_PATH}"
export CANGJIE_LOCAL_STDX_PATH="${CANGJIE_HOME}/modules/ios_simulator_aarch64_cjnative"
 
# 2. Confirm the simulator is booted
source "${WORKSPACE}/ios_sim_common.sh"
UDID="$(get_simulator_udid)" || exit 255
export XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST="$UDID"
echo "simulator: $UDID"
 
# 3. Ad-hoc sign the shared runtime dylibs once (before running the full test suite)
echo "signing runtime dylibs ..."
sign_dylibs_in_dir "$(ios_runtime_lib_dir)"
 
# 4. Invoke the framework
if [ -z "$TEST_PATH" ]; then
    echo "Error: 请传入用例路径(文件或套件目录)" >&2
    exit 255
fi
echo "config     : $CFG"
echo "test path  : $TEST_PATH"
echo "framework  : $CANGJIE_TEST_FRAMEWORK"
 
cd "${CANGJIE_TEST_FRAMEWORK}"
python3 ./main.py --test_cfg="${CFG}" "${RUN_CMD_ARGS[@]}" "${TEST_PATH}"