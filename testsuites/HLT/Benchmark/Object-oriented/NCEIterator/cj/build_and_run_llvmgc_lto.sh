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

source $LLVM_GC_DIR/envsetup.sh 
$LLVM_GC_DIR/bin/cjc --lto=full --int-overflow wrapping NCEIterator.cj -O2 -o llvm_gc_no_overflow

rm -f run.log

echo "Running Cangjie LLVM-GC:"
./llvm_gc_no_overflow $TOTAL_REPEATS 2>&1 | tee -a run.log
echo "--------------------"
