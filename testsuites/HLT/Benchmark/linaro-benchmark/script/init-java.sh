#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



case=$1
curPath=$(readlink -f "$(dirname "$0")")

init() {
    if [ -d $output ]
    then
        cd $curPath && rm -f timeStamp.log
    else
        echo "Erro! Directory output does not exist."
    fi
}

init
