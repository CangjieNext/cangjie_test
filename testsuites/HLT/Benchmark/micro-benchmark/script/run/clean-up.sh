#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



base=$PWD
data="$base/../data/json"
seria="$base/../../cj/serialize"
xmlfile="$base/../../cj/xml"
gzipfile="$base/../../cj/gzip"
function main(){
    # for json
    if [ -d "$data" ];then
        rm -rf ${data}/n* 
    else
        echo "Error! ${data} not exit."
    fi
    # for xml
    if [ -d "$xmlfile" ];then
	rm -rf ${xmlfile}/xml*
    else
	echo "Error! ${xmlfile} not exist."
    fi
    # for gzip
    if [ -d "$gzipFile" ];then
	rm -rf ${gzipfile}/gzipL*
    else
        echo "Error! ${gzipfile} not exist."
    fi

    # for serializable
    if [ -d "${seria}" ];then
        rm -rf ${seria}/*.cj
	rm -rf ${seria}/serialize.out
    else	
	echo "Error! ${seria} not exist"
    fi
}

main

