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

export ITERATIONS=30000
export REPEATS=3

# write last run's result to file
write_file(){
  if [ -z "$OUTPUT" ]; then
    return
  fi
  INPUT=$1
  lang=$2

  object=$(cat $INPUT | sed -n '/ComplexObject/p' | sed -n '$p' | awk '{print $7}' )
  struct=$(cat $INPUT | sed -n '/ComplexStruct/p' | sed -n '$p' | awk '{print $7}' )
  
  object=$(echo "scale=3;$object/1000" | bc)
  struct=$(echo "scale=3;$struct/1000" | bc)

  echo "complex/object,${lang},${object}" >> $OUTPUT
  echo "complex/struct,${lang},${struct}" >> $OUTPUT
}


if [ -n "$OUTPUT" ]; then
  echo "name,lang,time(s)" >> $OUTPUT
fi

TEST_LANG=$1
run_test "${TEST_LANG[*]}" write_file
