#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ "$parallelism" == "" ]; then
    export parallelism=1 
fi
go build -o StartEndCost StartEndCost.go

rm -f run.log

args=$@

export limitkb=$(( 128 * 1024 ))

ulimit -m $limitkb
echo "Ulimit in kb"
ulimit -m

GOMAXPROCS=$parallelism ./StartEndCost $args 2>&1 | tee -a run.log
