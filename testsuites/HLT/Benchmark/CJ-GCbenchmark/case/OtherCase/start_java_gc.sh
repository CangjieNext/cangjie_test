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

value=8

/home/yicheng/jdk/jdk17/jdk-17.0.2/bin/javac ${X}big.java

for ((i=1; i<=3; i++))
do

    if [ -n "$pid" ]; then
        wait $pid
    fi
    
    /home/yicheng/jdk/jdk17/jdk-17.0.2/bin/java -XX:-UseCompressedOops "-Xmx${value}g" "-Xlog:gc*:file=${X}_big_java_${value}.log:tags,uptime,level" ${X}big &
    pid=$!

    ./collect_Info.sh $pid "${X}_big_java_${value}" &
    
    value=$((value+8))
done


if [ -n "$pid" ]; then
    wait $pid
fi
    
unset pid    

value=8

for ((i=1; i<=3; i++))
do

    if [ -n "$pid" ]; then
        wait $pid
    fi
    
    /home/yicheng/jdk/jdk17/jdk-17.0.2/bin/java -XX:-UseCompressedOops -XX:+UseZGC "-Xmx${value}g" "-Xlog:gc*:file=${X}_big_javaz_${value}.log:tags,uptime,level" ${X}big &
    pid=$!

    ./collect_Info.sh $pid "${X}_big_javaz_${value}" &
    
    value=$((value+8))
done


if [ -n "$pid" ]; then
    wait $pid
fi
    
unset pid    

value=8



/home/yicheng/jdk/jdk17/jdk-17.0.2/bin/javac ${X}small.java


for ((i=1; i<=3; i++))
do

    if [ -n "$pid" ]; then
        wait $pid
    fi
    
    /home/yicheng/jdk/jdk17/jdk-17.0.2/bin/java -XX:-UseCompressedOops "-Xmx${value}g" "-Xlog:gc*:file=${X}_small_java_${value}.log:tags,uptime,level" ${X}small &
    pid=$!
    
    sleep 1
    
    ./collect_Info.sh $pid "${X}_small_java_${value}" &
    
    value=$((value+8))
done

if [ -n "$pid" ]; then
    wait $pid
fi

unset pid    

value=8

for ((i=1; i<=3; i++))
do

    if [ -n "$pid" ]; then
        wait $pid
    fi
    
    /home/yicheng/jdk/jdk17/jdk-17.0.2/bin/java -XX:-UseCompressedOops -XX:+UseZGC "-Xmx${value}g" "-Xlog:gc*:file=${X}_small_javaz_${value}.log:tags,uptime,level" ${X}small &
    pid=$!
    
    sleep 1
    
    ./collect_Info.sh $pid "${X}_small_javaz_${value}" &
    
    value=$((value+8))
done


