#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


# set -x

RUN_NUM=3
TEST_DIR=(Float16 Float32 Float64 Int8 Int16 Int32 Int64 ArrayList)

for testdir in  ${TEST_DIR[@]}
do
  printf "%-55s   %-15s %-15s %-15s\n" "$testdir:" "vectorized" "origional" "vec/ori(%)"
  cd $testdir
  for filename in `find ./ -name \*.cj | sort`
  do
  printf "  %-50s" $filename
  hyperfine -s "cjc --fast-math  -O2 --int-overflow  wrapping --opt-options='--enable-cj-gc-write-loop-vectorization=true' $filename;" -u millisecond  -r "$RUN_NUM" "./main" >result.txt 2>&1
  time0=`cat result.txt | grep Time | awk -F ":" '{print $2}' | awk -F "± " '{printf "%f", $1}'`
  cat result.txt | grep Time | awk -F ":" '{print $2}' | awk -F "± " '{printf " %-15s", $1}'
  rm result.txt
  hyperfine -s "cjc --fast-math  -O2 --int-overflow  wrapping --opt-options='--enable-cj-gc-write-loop-vectorization=false' $filename;" -u millisecond -r "$RUN_NUM" "./main" >result.txt 2>&1
  time1=`cat result.txt | grep Time | awk -F ":" '{print $2}' | awk -F "± " '{printf "%f", $1}'`
  cat result.txt | grep Time | awk -F ":" '{print $2}' | awk -F "± " '{printf "%-15s", $1}'
  awk 'BEGIN{printf "%15.1f%%\n", ('$time0'/'$time1')*100}'
  rm result.txt
  rm main
  done
  cd ../
done
