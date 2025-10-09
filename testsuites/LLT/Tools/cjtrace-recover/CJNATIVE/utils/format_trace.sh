#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

set -e
set -x

os=$1
type=$2
file=$3

sed_command="sed -i "
if [ "${os}" == "Darwin" ]; then
    sed_command="sed -i \"\" "
fi

if  [ "${type}" == "1" ]; then
    eval ${sed_command} "'/is not a valid mangling name/d'" ${file}
elif [ "${type}" == "2" ]; then
    eval ${sed_command} "'/should be the character/d'" ${file}
    ${command}
elif [ "${type}" == "3" ]; then
    eval ${sed_command} "'s/:[0-9]*)$/)/g'" ${file}
fi
