#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#
# 直接可执行文件路线：不经过 xcodebuild / .app / C 桥接。
# 前提：用例已由 cjc --output-type=exe 编译成模拟器可执行文件（见 *_exe 系列 cfg，
#       其中 output = main，所以工作目录里产物固定名是 ./main）。
#
# 框架在 work_dir 执行，$1 形如 "%run %output %run_args"
# 展开后为 "export ... && main <args>"。本脚本取出可执行文件 main，
# 完成 codesign -> simctl spawn，并把退出码返回框架。

set +x
set -e

WORKSPACE=$(cd `dirname $0`; pwd)

# 引入公共工具函数
source "$WORKSPACE/ios_sim_common.sh"

require_cangjie_home || exit 255

# 从 $1 中取出可执行文件名与参数
# $1 例: "export DYLD_LIBRARY_PATH=... && main arg1 arg2"
RUN_CMD="$1"
# 取 "&&" 之后的部分作为实际运行命令
ACTUAL="${RUN_CMD##*&&}"
ACTUAL="${ACTUAL## }"
EXE="$(echo "$ACTUAL" | awk '{print $1}')"
EXE="${EXE#./}"
ARGS="$(echo "$ACTUAL" | awk '{$1=""; print $0}' | sed 's/^ *//')"

if [ -z "$EXE" ] || [ ! -f "$EXE" ]; then
    echo "Error: cannot find executable '$EXE' in $(pwd)"
    exit 255
fi

# 签名可执行文件
sign_executable "$EXE"

# 签名当前工作目录里的动态库（链接到 DYLD 路径的 p1.a 等自定义库）。
# 注意：共享的运行时 dylib 不再在此签名，改由跑全套用例前一次性签名
# (见 ios_sign_runtime.sh)，避免多进程并发 codesign 竞争。
sign_dylibs_in_dir "$(pwd)"

# 找模拟器
UDID="$(get_simulator_udid)" || exit 255

# 运行
run_on_simulator "$UDID" "$EXE" $ARGS
ret=$?

exit $ret