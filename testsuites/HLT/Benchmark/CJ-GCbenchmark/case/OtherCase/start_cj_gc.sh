#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



if [ -z "$1" ]; then
    echo "Usage: $0 <X>"
    exit 1
fi

X=$1

cjc ${X}big.cj -o ${X}big

value=8

for ((i=1; i<=3; i++))
do

    export cjHeapSize="${value}GB"
    export MRT_REPORT="/home/yicheng/cangjie/program/src/DB/${X}_gc_big_${value}.txt"
    
    if [ -n "$pid" ]; then
        wait $pid
    fi
    
    ./${X}big &
    pid=$!
    
    ./collect_Info.sh $pid "${X}_big_cj${value}" &
    
    value=$((value+8))
done

if [ -n "$pid" ]; then
    wait $pid
fi

unset pid


cjc ${X}small.cj -o ${X}small


value=8

for ((i=1; i<=3; i++))
do

    export cjHeapSize="${value}GB"
    export MRT_REPORT="/home/yicheng/cangjie/program/src/DB/${X}_gc_small_${value}.txt"
    
    if [ -n "$pid" ]; then
        wait $pid
    fi
    
    ./${X}small &
    pid=$!
    
    ./collect_Info.sh $pid "${X}_small_cj${value}" &
    
    value=$((value+8))
done