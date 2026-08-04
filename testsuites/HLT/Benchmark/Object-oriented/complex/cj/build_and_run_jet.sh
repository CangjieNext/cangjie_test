#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ -z "$JET_DIR" ]; then
  JET_DIR=
fi

if [ -z "$ITERATIONS" ]; then
  ITERATIONS=30000
fi

if [ -z "$REPEATS" ]; then
  REPEATS=3
fi

source $JET_DIR/envsetup.sh

$JET_DIR/bin/cjc --int-overflow wrapping complex.cj -o complex.cbc

rm -f run.log

cj ./complex.cbc $ITERATIONS $REPEATS 0 | tee -a run.log
cj ./complex.cbc $ITERATIONS $REPEATS 1 | tee -a run.log
