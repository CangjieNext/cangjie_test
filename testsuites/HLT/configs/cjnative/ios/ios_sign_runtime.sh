#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#
# 跑 iOS 模拟器 exe 路线全套用例前，一次性给共享的运行时 dylib 做 ad-hoc 签名。
# 因为运行时 dylib 是所有用例共享的，若在每个用例的 run 脚本里并发签名会有竞争，
# 所以提前统一签好，run 脚本就不再用 sign_runtime_dylibs。
#
# 用法:
#   bash ios_sign_runtime.sh [arm64|x86_64]
 
set -e
 
WORKSPACE=$(cd `dirname $0`; pwd)
source "$WORKSPACE/ios_sim_common.sh"
 
require_cangjie_home || exit 255
 
ARCH="${1:-arm64}"
lib_dir=$(ios_runtime_lib_dir "$ARCH")
 
echo "signing runtime dylibs in: $lib_dir"
sign_runtime_dylibs "$lib_dir"
echo "done."
 
exit 0