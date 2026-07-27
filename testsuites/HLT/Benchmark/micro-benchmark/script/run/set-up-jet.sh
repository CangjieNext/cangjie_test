#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



base=$PWD
setup="$base/../setup/"
mod="$base/../../../../../"
result="$base/../result"
seria="$base/../../cj/serialize"
export GOPATH="$base/../../go"
export JETVMPROP="-Xmx32G"

function setup_cj(){
    cd $setup
    cjc generateSerializableData.cj -o generateSerializableData.cbc
    cj ./generateSerializableData.cbc
}

function main(){
    setup_cj
}

main

