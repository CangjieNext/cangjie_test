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
export cjHeapSize=32GB

function setup_cj_lto(){
    # for json cases
    cd $setup
    python3 generate_json_data.py
    #for xml case
    cd $setup
    python3 generate_xml_data.py
    #for gzip
    cd $setup
    python3 generate_gzip_File.py

    # for serialize cases
    if [ -d "${seria}" ];then
        rm -rf $seria/*.cj
	      rm -rf $seria/serialize.out
    else
        mkdir -p $seria
    fi
    
    cjc generateSerializableData.cj -o generateSerializableData.out
    ./generateSerializableData.out
}

function main(){
    setup_cj_lto
}

main

