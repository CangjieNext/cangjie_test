#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ -z "$LLVM_GC_DIR" ]; then
  LLVM_GC_DIR=
fi

if [ -z "$TOTAL_REPEATS" ]; then
  TOTAL_REPEATS=3
fi

cp ../data.txt .
rm -f run.log

source $LLVM_GC_DIR/envsetup.sh 
echo "Running Cangjie LLVM-GC:"
$LLVM_GC_DIR/bin/cjc --lto=full -O2 --int-overflow wrapping gameoflife.cj -o gameoflife_llvmgc
cjHeapSize=768mb ./gameoflife_llvmgc $TOTAL_REPEATS | tee -a run.log
echo "--------------------"
