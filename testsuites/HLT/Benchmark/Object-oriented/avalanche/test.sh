#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


source ../env.sh

if [ -z "$OUTPUT" ]; then
  OUTPUT=./result.csv
fi

# option
export ITERATION_PER_THREAD=100000000
export TOTAL_REPEATS=3
export THREADS_ARRAY="1 8 16 32"

# write last run's result to file
write_file(){
  if [ -z "$OUTPUT" ]; then
    return
  fi

  INPUT=$1
  lang=$2
  ts=($THREADS_ARRAY)
  len=${#ts[@]}
  Throughput=()
  Normalized_throughput=()
  for i in ${ts[*]}
  do
    t=$(cat $INPUT | grep -n -A 2 "${i} worker threads" | sed -n '/Throughput/p' | sed -n '$p' |  grep -P '\d+.\d+' -o)
    nt=$(cat $INPUT | grep -n -A 2 "${i} worker threads" | sed -n '/Normalized throughput/p' | sed -n '$p' |  grep -P '\d+.\d+' -o)
  
    Throughput+=($t)
    Normalized_throughput+=($nt)
  done
  
  for ((i=0;i<"$len";i++))
  do
    echo "avalanche/Throughput/${ts[${i}]}t,${lang},${Throughput[${i}]}" >> $OUTPUT
  done
  
  for ((i=0;i<"$len";i++))
  do
    echo "avalanche/Normalized throughput/${ts[${i}]}t,${lang},${Normalized_throughput[${i}]}" >> $OUTPUT
  done
}

if [ -n "$OUTPUT" ]; then
  echo "name,lang,units / msec" >> $OUTPUT
fi

TEST_LANG=$1

run_test "${TEST_LANG[*]}" write_file
