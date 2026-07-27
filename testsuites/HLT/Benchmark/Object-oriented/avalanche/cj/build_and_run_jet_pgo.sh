#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ -z "$JET_DIR_BETA" ]; then
  JET_DIR_BETA=
fi

if [ -z "$ITERATION_PER_THREAD" ]; then
  ITERATION_PER_THREAD=100000000
fi

if [ -z "$TOTAL_REPEATS" ]; then
  TOTAL_REPEATS=3
fi

if [ -z "$THREADS_ARRAY" ]; then
  THREADS_ARRAY="1 8 16 32"
fi

ts=($THREADS_ARRAY)

source $JET_DIR_BETA/envsetup.sh
$JET_DIR_BETA/bin/cjc --int-overflow wrapping avalanche.cj -o avalanche.cbc

for t in ${ts[*]}
do
  JETVMPROP=-Djet.profiler cj ./avalanche.cbc $ITERATION_PER_THREAD $t $TOTAL_REPEATS > /dev/null 2>&1
done

$JET_DIR_BETA/bin/cjc --jc-options="+pgo -jprofile=avalanche.cbc.jprof" --int-overflow wrapping avalanche.cj -o avalanche.cbc > /dev/null 2>&1

rm -f run.log

export JETVMPROP="-Djet.gc.heaplimit=1g"
for t in ${ts[*]}
do
  cj avalanche.cbc $ITERATION_PER_THREAD $t $TOTAL_REPEATS | tee -a run.log
done
