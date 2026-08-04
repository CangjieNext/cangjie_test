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

cp ../data.txt .

source $JET_DIR_BETA/envsetup.sh 
$JET_DIR_BETA/bin/cjc --int-overflow wrapping gameoflife.cj -o gameoflife.cbc 
JETVMPROP=-Djet.profiler cj gameoflife.cbc 1 > /dev/null 2>&1

rm -rf run.log

$JET_DIR_BETA/bin/cjc --jc-options="+pgo -jprofile=gameoflife.cbc.jprof" --int-overflow wrapping gameoflife.cj -o gameoflife.cbc > /dev/null 2>&1
echo "Running Cangjie JET PGO:"
JETVMPROP="-Djet.gc.heaplimit=768m" cj gameoflife.cbc $TOTAL_REPEATS | tee -a run.log
echo "--------------------"
