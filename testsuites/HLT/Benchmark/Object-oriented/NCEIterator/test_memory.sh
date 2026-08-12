#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

export JET_DIR=/home/jenkins2/workspace/Object-oriented_All_Daily_aarch64/Cangjie/cangjie_jet/cangjie
export JAVA_HOME=/home/jenkins2/workspace/zhy_tmp/jdk8u372-b07-jre/
export PATH=$JAVA_HOME/bin:$PATH

export JETVMPROP=-Xmx100M

# bash test.sh cj/jet & 

# for i in $(seq 1 30); do ps -aux | grep "cj \./NCEIterator" | awk '{print $6}' >> cj_memory; sleep 1; done

bash test.sh cj/jet/pgo & 

for i in $(seq 1 30); do ps -aux | grep "cj \./NCEIterator" | awk '{print $6}' >> cj_pgo_memory; sleep 1; done

cd java
javac NCEIterator.java

echo "Running Java Hotspot:"
java -Xmx100M NCEIterator 3 &

for i in $(seq 1 30); do ps -aux | grep "M NCEIterator" | grep "Sl+" | awk '{print $6}' >> ../java_memory; sleep 1; done
