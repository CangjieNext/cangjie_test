#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ -z "$JET_DIR" ]; then
  JET_DIR=
fi

if [ -z "$TOTAL_REPEATS" ]; then
  TOTAL_REPEATS=3
fi

cp ../data.txt .
rm -f run.log

source $JET_DIR/envsetup.sh 

$JET_DIR/bin/cjc --int-overflow wrapping gameoflife.cj -o gameoflife_jet.cbc
echo "Running Cangjie JET:"
JETVMPROP="-Djet.gc.heaplimit=768m" cj ./gameoflife_jet.cbc $TOTAL_REPEATS | tee -a run.log
echo "--------------------"
