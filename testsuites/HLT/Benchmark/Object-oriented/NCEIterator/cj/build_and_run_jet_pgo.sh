#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ -z "$JET_DIR_BETA" ]; then
  JET_DIR_BETA=
fi

if [ -z "$TOTAL_REPEATS" ]; then
  TOTAL_REPEATS=3
fi

source $JET_DIR_BETA/envsetup.sh

$JET_DIR_BETA/bin/cjc --int-overflow wrapping NCEIterator.cj -o NCEIterator.cbc
JETVMPROP=-Djet.profiler cj ./NCEIterator.cbc $TOTAL_REPEATS > /dev/null 2>&1

$JET_DIR_BETA/bin/cjc --jc-options="+pgo -jprofile=NCEIterator.cbc.jprof -cleancompilation" --int-overflow wrapping NCEIterator.cj -o NCEIterator.cbc > /dev/null 2>&1

rm -f run.log

echo "Running Cangjie JET PGO:"
cj NCEIterator.cbc $TOTAL_REPEATS 2>&1 | tee -a run.log
echo "--------------------"
