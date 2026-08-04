#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

if [ "$parallelism" == "" ]; then
    export parallelism=1 
fi
if [ "$sec_to_sleep" == "" ]; then
    export sec_to_sleep=5
fi

go build -o PerThreadMemUsage PerThreadMemUsage.go

rm -f run.log

# thread 1
GOMAXPROCS=$parallelism ./PerThreadMemUsage 1 &
pid=$!

sleep $sec_to_sleep
THREAD_1=`cat /proc/$pid/status | grep VmRSS | awk '{print $2}'`

kill $pid >> /dev/null

N=$@

GOMAXPROCS=$parallelism ./PerThreadMemUsage $N &
pid=$!

sleep $sec_to_sleep
THREAD_N=`cat /proc/$pid/status | grep VmRSS | awk '{print $2}'`

kill $pid >> /dev/null
echo "scale=2;($THREAD_N-$THREAD_1)/($N-1)" | bc | tee -a run.log
