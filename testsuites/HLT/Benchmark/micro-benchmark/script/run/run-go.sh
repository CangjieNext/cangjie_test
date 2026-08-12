#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



api=$1
base=$PWD
testlist="$base/../testlist/testlist-go-$api"
result=$base/../result
result_log="result-go-${api}.log"
result_list="result-go-${api}.list"
export GOPATH="$base/../../go"

function run_benchmark() {
    export GO111MODULE=on
    cd $base/../../go/$api
    if [ $api = "url" ];then
        go test -bench=. -timeout=30m -cpu 1 >> ${result}/${result_log}
        echo "url"
    elif [ $api = "log" ];then
        echo "log case not suitable for running"
    elif [ $api = "server_http" ];then
        export GO111MODULE=off
        go test server_http_test.go &
        cd $base
        bash server_http.sh go
        sed -i 's/://g; s/ns\/op//g' ../result/result-go-server_http.list
        kill -9 $(lsof -t -i:62001)
    elif [ $api = "server_https" ];then
        export GO111MODULE=off
        go test server_https_test.go &
        cd $base
        bash server_https.sh go
        sed -i 's/://g; s/ns\/op//g' ../result/result-go-server_https.list
        kill -9 $(lsof -t -i:62002)
    elif [ $api = "server_http2" ];then
        export GO111MODULE=off
        go test server_http2_test.go &
        cd $base
        bash server_http2.sh go
        sed -i 's/://g; s/ns\/op//g' ../result/result-go-server_http2.list
        kill -9 $(lsof -t -i:62003)
    else
        go test -bench=. -timeout=30m >> ${result}/${result_log}
    fi
    export GO111MODULE=on
}

function get_result() {
    cd $base/../testlist/
    while read line
    do
        num=`cat ${result}/${result_log} | grep -n "${line}-" | awk -F ":" '{print $1}'`
        strr=`sed -n "${num}p" ${result}/${result_log}`
        arr=(${strr//,/ })
        res=${arr[2]}
        if [ -n "$res" ]; then
            echo "$line $res" >> ${result}/${result_list}
            sed -i "s/goarch:/-1/g" ${result}/${result_list}
            sed -i "s/quit/-1/g" ${result}/${result_list}
        elif [[ ${line} = *"Server" ]]; then
            echo "httpserver ignored"
        else
            echo "Error: ${line} failed to run."
        fi
    done < $testlist
}

function main() {
    run_benchmark
    get_result
}

main
