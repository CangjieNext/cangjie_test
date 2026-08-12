#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ -z "$TOTAL_REPEATS" ]; then
  TOTAL_REPEATS=3
fi

export BENCH_DIR=build
export BENCH_NAME=GameOfLife

mkdir $BENCH_DIR
cp source/$BENCH_NAME.java $BENCH_DIR
cp ../data.txt $BENCH_DIR

rm -f run.log

cd $BENCH_DIR
javac $BENCH_NAME.java

echo "Running Java Hotspot:"
java -Xmx768m $BENCH_NAME $TOTAL_REPEATS | tee -a ../run.log
echo "-----------------"
cd ..
