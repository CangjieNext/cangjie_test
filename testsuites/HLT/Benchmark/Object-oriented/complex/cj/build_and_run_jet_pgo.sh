#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ -z "$JET_DIR_BETA" ]; then
  JET_DIR_BETA=
fi

if [ -z "$ITERATIONS" ]; then
  ITERATIONS=30000
fi

if [ -z "$REPEATS" ]; then
  REPEATS=3
fi

source $JET_DIR_BETA/envsetup.sh

$JET_DIR_BETA/bin/cjc --int-overflow wrapping complex.cj -o complex.cbc
export JETVMPROP=-Djet.profiler
cj complex.cbc $ITERATIONS $REPEATS 0 > /dev/null 2>&1
cj complex.cbc $ITERATIONS $REPEATS 1 > /dev/null 2>&1

$JET_DIR_BETA/bin/cjc --jc-options="+pgo -jprofile=complex.cbc.jprof -cleancompilation" --int-overflow wrapping complex.cj -o complex.cbc > /dev/null 2>&1

rm -f run.log

cj complex.cbc $ITERATIONS $REPEATS 0 | tee -a run.log
cj complex.cbc $ITERATIONS $REPEATS 1 | tee -a run.log
