#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ -z "$LOOM_DIR" ]; then
  LOOM_DIR=
fi
if [ "$parallelism" == "" ]; then
    export parallelism=32
fi

$LOOM_DIR/bin/javac --source 19 --enable-preview Echo.java

rm -f run.log

args=$@

$LOOM_DIR/bin/java -Djdk.virtualThreadScheduler.parallelism=$parallelism --enable-preview Echo $args 2>&1 | tee -a run.log
