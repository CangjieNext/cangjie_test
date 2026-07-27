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

export TOTAL_REPEATS=3

# write last run's result to file
write_file(){
  if [ -z "$OUTPUT" ]; then
    return
  fi
  INPUT=$1
  lang=$2

  time=$(cat $INPUT | sed -n '/Total time/p' | sed -n '$p' | awk '{print $6}')

  time=$(echo "scale=3;$time/1000" | bc)

  echo "NCEIterator,${lang},${time}" >> $OUTPUT
}

if [ -n "$OUTPUT" ]; then
  echo "name,lang,time(s)" >> $OUTPUT
fi

TEST_LANG=$1

run_test "${TEST_LANG[*]}" write_file
