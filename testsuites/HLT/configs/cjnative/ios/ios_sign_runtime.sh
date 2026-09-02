#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#
# Before running the full suite of iOS simulator exe-route test cases, ad-hoc sign the shared runtime dylibs once, up front.
# Since the runtime dylibs are shared by all test cases, signing them concurrently in each test case's run script would race,
# so sign them all together in advance; the run scripts no longer call sign_runtime_dylibs.
#
# usage:
#   bash ios_sign_runtime.sh [arm64|x86_64]
 
set -e
 
WORKSPACE=$(cd `dirname $0`; pwd)
source "$WORKSPACE/ios_sim_common.sh"
 
require_cangjie_home || exit 255
 
ARCH="${1:-arm64}"
lib_dir=$(ios_runtime_lib_dir "$ARCH")
 
echo "signing runtime dylibs in: $lib_dir"
sign_dylibs_in_dir "$lib_dir"
echo "done."
 
exit 0