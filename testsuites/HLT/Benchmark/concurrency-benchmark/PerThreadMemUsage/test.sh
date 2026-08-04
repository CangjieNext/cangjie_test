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

# write last run's result to file
write_file(){
  if [ -z "$OUTPUT" ]; then
    return
  fi
  INPUT=$1
  lang=$2

  args=($@)
  lable=${args[@]:2:$#}

  mem=$(cat $INPUT)

  echo "PerThreadMemUsage_$lable,${lang},${mem}" >> $OUTPUT
}

if [ -n "$OUTPUT" ]; then
  echo "name,lang,mem(KB)" >> $OUTPUT
fi

TEST_LANG=$1

run_test "${TEST_LANG[*]}" write_file
