#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ -z "$LLVM_GC_DIR" ]; then
  LLVM_GC_DIR=
fi 
if [ "$parallelism" == "" ]; then
    export parallelism=32
fi

source $LLVM_GC_DIR/envsetup.sh
$LLVM_GC_DIR/bin/cjc --int-overflow wrapping SynchProdCons.cj -O2 -o SynchProdCons 

rm -f run.log

args=$@

cjProcessorNum=$parallelism ./SynchProdCons $args 2>&1 | tee -a run.log
