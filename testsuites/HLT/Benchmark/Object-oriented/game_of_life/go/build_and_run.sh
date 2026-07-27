#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ -z "$TOTAL_REPEATS" ]; then
  TOTAL_REPEATS=3
fi

go build GoLife.go
cp ../data.txt .

export limitkb=$(( 768 * 1024 ))

rm -f run.log

ulimit -m $limitkb
echo "Ulimit in kb"
ulimit -m

echo "running Go:"
GOGC=100 ./GoLife $TOTAL_REPEATS | tee -a run.log
