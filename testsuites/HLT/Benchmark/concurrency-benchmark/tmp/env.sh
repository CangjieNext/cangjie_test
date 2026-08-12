#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

declare -A PATH_MAP
declare -A SCRIPT_MAP

PATH_MAP["cj/jet"]="cj"
PATH_MAP["cj/jet/pgo"]="cj"
PATH_MAP["cj/llvmgc"]="cj"
PATH_MAP["cj/llvmgc/lto"]="cj"
PATH_MAP["go"]="go"
PATH_MAP["java"]="java"
PATH_MAP["loom"]="loom"

SCRIPT_MAP["cj/jet"]="build_and_run_jet.sh"
SCRIPT_MAP["cj/jet/pgo"]="build_and_run_jet_pgo.sh"
SCRIPT_MAP["cj/llvmgc"]="build_and_run_llvmgc.sh"
SCRIPT_MAP["cj/llvmgc/lto"]="build_and_run_llvmgc_lto.sh"
SCRIPT_MAP["go"]="build_and_run.sh"
SCRIPT_MAP["java"]="build_and_run.sh"
SCRIPT_MAP["loom"]="build_and_run.sh"

run_test() {
  TEST_LANG=$1
  write_file=$2

  for lang in ${TEST_LANG[@]}
  do
    path=${PATH_MAP[${lang}]}
    script=${SCRIPT_MAP[${lang}]}
    echo "${lang}..."
    while read args
    do
      if [ -d "$path" ]; then
        cd $path
        "./${script}" $args
        cd ..
      $write_file ${path}/run.log ${lang} ${args}
      fi
    done < args
  done
}
