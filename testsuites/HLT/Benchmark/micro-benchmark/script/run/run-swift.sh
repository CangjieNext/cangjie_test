#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



api=$1
base=$PWD/../result
testlist="../testlist/testlist-swift-$api"
result_log="$base/result-swift-${api}.list"
opt="-O -wmo"

function run_benchmark() {
    mod="$base/../../swift/$api"
    cd $mod
    result="result-swift-${api}.list"
    benchmark=$1
    swiftc ${benchmark}.swift $opt
    res=`timeout 1200 ./${benchmark}`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function read_testlist() {
    while read line
    do
        echo $line
        if [ -n "$line" ]; then
            run_benchmark $line
        else
            echo "Error: a row of ${testlist} is empty."
        fi
    done < $testlist
}

case "${api}" in
  "loop")
    printf "benchmarking swift-loop\n"
    read_testlist
    ;;
  "collections_arraylist")
    printf "benchmarking swift-collections_arraylist\n"
    read_testlist
    ;;
  "collections_hashmap")
    printf "benchmarking swift-collections_hashmap\n"
    read_testlist
    ;;
  "collections_hashset")
    printf "benchmarking swift-collections_hashset\n"
    read_testlist
    ;;
  *)
    printf "${api} benchmark has not been implemented yet.\n"
    exit
    ;;
esac