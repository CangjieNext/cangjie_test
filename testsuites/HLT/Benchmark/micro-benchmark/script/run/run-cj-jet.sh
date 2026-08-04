#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



api=$1
base=$PWD/../result
testlist="../testlist/testlist-cj-$api"

import_cangjie_stdx=
if [[ "$api" == "client_http" ]] || [[ "$api" == "client_http2" ]] || \
   [[ "$api" == "client_https" ]] || [[ "$api" == "collections_hashmap" ]] || \
   [[ "$api" == "collections_hashset" ]] || [[ "$api" == "expression" ]] || \
   [[ "$api" == "gzip" ]] || [[ "$api" == "http" ]] || \
   [[ "$api" == "http2" ]] || [[ "$api" == "https" ]] || \
   [[ "$api" == "json" ]] || [[ "$api" == "log" ]] || \
   [[ "$api" == "loop" ]] || [[ "$api" == "oldjson" ]] || \
   [[ "$api" == "server_http" ]] || [[ "$api" == "server_http2" ]] || \
   [[ "$api" == "server_https" ]] || [[ "$api" == "url" ]] || [[ "$api" == "serialize" ]]; then
    import_cangjie_stdx="$CANGJIE_STDX_PATH/stdx.pdba $CANGJIE_STDX_PATH/stdx.compress.pdba $CANGJIE_STDX_PATH/stdx.compress.zlib.pdba $CANGJIE_STDX_PATH/stdx.crypto.pdba $CANGJIE_STDX_PATH/stdx.crypto.digest.pdba $CANGJIE_STDX_PATH/stdx.crypto.crypto.pdba $CANGJIE_STDX_PATH/stdx.encoding.pdba $CANGJIE_STDX_PATH/stdx.encoding.base64.pdba $CANGJIE_STDX_PATH/stdx.encoding.hex.pdba $CANGJIE_STDX_PATH/stdx.crypto.x509.pdba $CANGJIE_STDX_PATH/stdx.crypto.keys.pdba $CANGJIE_STDX_PATH/stdx.encoding.json.stream.pdba $CANGJIE_STDX_PATH/stdx.encoding.url.pdba $CANGJIE_STDX_PATH/stdx.log.pdba $CANGJIE_STDX_PATH/stdx.logger.pdba $CANGJIE_STDX_PATH/stdx.net.pdba $CANGJIE_STDX_PATH/stdx.net.tls.pdba $CANGJIE_STDX_PATH/stdx.net.http.pdba $CANGJIE_STDX_PATH/stdx.serialization.pdba $CANGJIE_STDX_PATH/stdx.serialization.serialization.pdba $CANGJIE_STDX_PATH/stdx.encoding.json.pdba --import-path $CANGJIE_STDX_PATH"
else
    import_cangjie_stdx=
fi

opt="--int-overflow=wrapping -Woff all $import_cangjie_stdx"
result_log="$base/result-jet-${api}.list"
export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M"

function read_testlist() {
    while read line
    do
        echo $line
        if [ -n "$line" ]; then
            if [ $api = "cffi" ]; then
                run_cffi_benchmark $line
            elif [ $api = "collections_arraylist" ]; then
                run_string_benchmark $line
            elif [ $api = "collections_hashmap" ]; then
                run_string_benchmark $line
            elif [ $api = "collections_hashset" ]; then
                run_collections_hashset_benchmark $line
            elif [ $api = "collections_arraydeque" ]; then
                run_string_benchmark $line
            elif [ $api = "collections_arraystack" ]; then
                run_string_benchmark $line
            elif [ $api = "collections_blockingqueue" ]; then
                run_string_benchmark $line
            elif [ $api = "collections_linkedlist" ]; then
                run_string_benchmark $line
            elif [ $api = "collections_treemap" ]; then
                run_string_benchmark $line
            elif [ $api = "collections_treeset" ]; then
                run_string_benchmark $line
            elif [ $api = "loop" ]; then
                run_string_benchmark $line   
            elif [ $api = "regex" ]; then
                run_regex_benchmark $line
            elif [ $api = "serialize" ];then
                run_serialize_benchmark $line
            elif [ $api = "concurrency" ];then
                run_concurrency_benchmark $line
            elif [ $api = "atomic" ];then
                run_atomic_aarch64_benchmark $line
            elif [ $api = "string" ];then
                run_string_benchmark $line
            elif [ $api = "stringbuilder" ];then
                run_string_benchmark $line
            elif [ $api = "array" ];then
                run_string_benchmark $line
            elif [ $api = "url" ];then
                run_string_benchmark $line
            elif [ $api = "server_http" ];then
                run_server_benchmark $line
            elif [ $api = "server_https" ];then
                run_server_benchmark $line
            elif [ $api = "server_http2" ];then
                run_server_benchmark $line
            elif [ $api = "objectpool" ];then
                run_objectpool_benchmark $line
            elif [ $api = "log" ];then
                run_string_benchmark $line
            elif [ $api = "lambda" ]; then
                run_string_benchmark $line
            elif [ $api = "override" ]; then
                run_string_benchmark $line
            elif [ $api = "libast_api" ]; then
                run_ast_benchmark $line
            elif [ $api = "libast_scene" ]; then
                run_ast_benchmark $line
            elif [ $api = "reflect" ]; then
                run_reflect_benchmark $line
            else
                run_benchmark $line
            fi
        else
            echo "Error: a row of ${testlist} is empty."
        fi
    done < $testlist
}

function run_benchmark() {
    mod="$base/../../cj/$api"
    cd $mod
    result="result-jet-${api}.list"
    benchmark=$1
    cjc ${benchmark}.cj $opt -o ${benchmark}.cbc
    res=`timeout 1800 cj --cbc-path $CANGJIE_STDX_PATH ./${benchmark}.cbc`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark}  failed to run."
    fi
}

function run_objectpool_benchmark() {
    mod="$base/../../cj/$api"
    cd $mod
    result="result-jet-${api}.list"
    benchmark=$1
    cjc ${benchmark}.cj --test $opt -o ${benchmark}.cbc
    res=`timeout 2400 cj --cbc-path $CANGJIE_STDX_PATH ./${benchmark}.cbc --no-progress --reportFormat=xml --reportPath=./tmpfile`
    rm -rf ./tmpfile
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark}  failed to run."
    fi
}

function run_reflect_benchmark() {
    mod="$base/../../cj/$api"
    cd $mod
    result="result-jet-${api}.list"
    benchmark=$1
    cjc benchmark_classes.cj ${benchmark}.cj --test $opt -o ${benchmark}.cbc
    res=`timeout 1800 cj --cbc-path $CANGJIE_STDX_PATH ./${benchmark}.cbc --bench --no-color`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_server_benchmark() {
    mod="$base/../../cj/$api"
    cd $mod
    benchmark=$1
    cjc ${benchmark}.cj $opt -o ${benchmark}.cbc
    timeout 1800 cj --cbc-path $CANGJIE_STDX_PATH ./${benchmark}.cbc &
    echo "${benchmark} started."
}

function run_string_benchmark() {
    mod="$base/../../cj/$api"
    cd $mod
    result="result-jet-${api}.list"
    benchmark=$1
    cjc ${benchmark}.cj $opt -o ${benchmark}.cbc --test
    res=`timeout 1800 cj --cbc-path $CANGJIE_STDX_PATH ./${benchmark}.cbc --bench --no-color`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_ast_benchmark() {
    mod="$base/../../cj/$api"
    cd $mod
    result="result-jet-${api}.list"
    benchmark=$1
    cjc ${benchmark}.cj inputs.cj utils.cj visitors.cj $opt -o ${benchmark}.cbc --test
    res=`timeout 1800 cj --cbc-path $CANGJIE_STDX_PATH ./${benchmark}.cbc --bench --no-color`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_cffi_benchmark() {
    cd "$base/../../cj/cffi"
    result="result-jet-cffi.list"
    benchmark=$1
    clang -shared -fPIC ${benchmark}.c -o lib${benchmark}.so
    cjc --error-count-limit=all -l${benchmark} ${benchmark}.cj $opt -o ${benchmark}.cbc
    res=`timeout 1800 cj --cbc-path $CANGJIE_STDX_PATH ./${benchmark}.cbc`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_collections_hashset_benchmark() {
    cd "$base/../../cj/collections_hashset"
    result="result-jet-collections_hashset.list"
    benchmark=$1
    cjc ${benchmark}.cj common_collection.cj $opt -o ${benchmark}.cbc
    res=`timeout 1800 cj --cbc-path $CANGJIE_STDX_PATH ./${benchmark}.cbc`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_regex_benchmark() {
    cd "$base/../../cj/regex"
    result="result-jet-regex.list"
    benchmark=$1
    cjc ${benchmark}.cj generateRegexData.cj $opt -o ${benchmark}.cbc
    res=`timeout 1800 cj --cbc-path $CANGJIE_STDX_PATH ./${benchmark}.cbc`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_serialize_benchmark(){
    cd "$base/../../cj/serialize"
    result="result-jet-serialize.list"
    benchmark=$1
    cjc *.cj $opt -o ${benchmark}.cbc
    res=`timeout 1800 cj --cbc-path $CANGJIE_STDX_PATH ./${benchmark}.cbc`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi   
}

function run_concurrency_benchmark(){
    cd "$base/../../cj/concurrency"
    result="result-jet-concurrency.list"
    benchmark=$1
    cjc ${benchmark}.cj Concurrency.cj WaitGroup.cj $opt -o ${benchmark}.cbc
    res=`timeout 1800 cj --cbc-path $CANGJIE_STDX_PATH ./${benchmark}.cbc`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_atomic_aarch64_benchmark(){
    result="result-jet-atomic.list"
    optimized=(
        "BenchmarkConcurrencyAddInt32" 
        "BenchmarkConcurrencyAddInt64" 
        "BenchmarkConcurrencyAddUInt32" 
        "BenchmarkConcurrencyAddUInt64" 
        "BenchmarkConcurrencyAtomicReferenceSwap" 
        "BenchmarkConcurrencySubInt32" 
        "BenchmarkConcurrencySubInt64" 
        "BenchmarkConcurrencySubUInt32" 
        "BenchmarkConcurrencySubUInt64" 
        "BenchmarkConcurrencySwapInt32" 
        "BenchmarkConcurrencySwapInt64" 
        "BenchmarkConcurrencySwapUInt32" 
        "BenchmarkConcurrencySwapUInt64"
    )
    benchmark=$1

    mod="$base/../../cj/atomic"
    cd $mod

    cjc ${benchmark}.cj $opt -o ${benchmark}.cbc
    res=`timeout 1800 cj --cbc-path $CANGJIE_STDX_PATH ./${benchmark}.cbc`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function get_result() {
    cd $base/../testlist/
    while read line
    do
        sed -i '/ Benchmark/!d' $result_log
        grep $line $result_log > $base/temp.txt
        awk -F '|' '{gsub(/ /, "",$(NF-6)); gsub(/[ -]/, "",$(NF-5)); gsub(/,/, "_",$(NF-5)); print $(NF-6)$(NF-5) $(NF-1)}' $base/temp.txt >> $base/result.txt
    done < $testlist

    while read line
    do
        echo $line | cut -f 1,2,3,4,5  -d ' ' >> $base/final.txt
    done < $base/result.txt

    while read line
    do
        if [[ $line == *"us"* ]]; then
            num=`echo $line | cut -f 2 -d ' '`
            new_num=$(echo "$num * 1000" | bc)
            newline=$(echo $line | sed "s/$num/$new_num/g  ; s/us/ns/g")
            sed -i "s#$line#$newline#g"  $base/final.txt
        elif [[ $line == *"ms"* ]]; then
            num=`echo $line | cut -f 2 -d ' '`
            new_num=$(echo "$num * 1000000" | bc)
            newline=$(echo $line | sed "s/$num/$new_num/g  ; s/ms/ns/g")
            sed -i "s#$line#$newline#g"  $base/final.txt
        fi
    done < $base/final.txt

    awk '{print $1":",$2}' $base/final.txt > "$base/unsorted.list"
    sed -i 's/$/ ns\/op/' $base/unsorted.list

    sort $base/unsorted.list | uniq > $base/result-jet-${api}.list

    if [ -e "$base/unsorted.list" ];then
        rm -rf ${base}/unsorted.list* 
    else
        echo "Error! ${base}/unsorted.list not exit."
    fi

    if [ -e "$base/final.txt" ];then
        rm -rf ${base}/final.txt* 
    else
        echo "Error! ${base}/final.txt not exit."
    fi

    if [ -e "$base/result.txt" ];then
        rm -rf ${base}/result.txt* 
    else
        echo "Error! ${base}/result.txt not exit."
    fi

    if [ -e "$base/temp.txt" ];then
        rm -rf ${base}/temp.txt* 
    else
        echo "Error! ${base}/temp.txt not exit."
    fi
}

function main() {
    read_testlist
    if [ $api = "string" ]; then
        get_result
    elif [ $api = "stringbuilder" ]; then
        get_result
    elif [ $api = "array" ]; then
        get_result
    elif [ $api = "url" ]; then
        get_result
    elif [ $api = "collections_arraylist" ]; then
        get_result
    elif [ $api = "collections_hashmap" ]; then
        get_result
    elif [ $api = "collections_arraydeque" ]; then
        get_result
    elif [ $api = "collections_arraystack" ]; then
        get_result
    elif [ $api = "collections_blockingqueue" ]; then
        get_result
    elif [ $api = "collections_linkedlist" ]; then
        get_result
    elif [ $api = "collections_treemap" ]; then
        get_result
    elif [ $api = "collections_treeset" ]; then
        get_result
    elif [ $api = "reflect" ]; then
        get_result
    elif [ $api = "loop" ]; then
        get_result
    elif [ $api = "log" ]; then
        get_result
    elif [ $api = "lambda" ]; then
        get_result
    elif [ $api = "libast_api" ]; then
        get_result
    elif [ $api = "override" ]; then
        get_result
    elif [ $api = "libast_scene" ]; then
        get_result
    elif [ $api = "server_http" ]; then
        cd  $base/../run
        bash $base/../run/server_http.sh jet
        kill -9 $(lsof -t -i:62001)
        echo "http server stopped"
    elif [ $api = "server_https" ]; then
        cd  $base/../run
        bash $base/../run/server_https.sh jet
        kill -9 $(lsof -t -i:62002)
        echo "https server stopped"
    elif [ $api = "server_http2" ]; then
        cd  $base/../run
        bash $base/../run/server_http2.sh jet
        kill -9 $(lsof -t -i:62003)
        echo "http2 server stopped"
    elif [ $api = "createobject" ]; then
        cd  $base/../result
        sed -i '/Benchmark/!d' result-jet-createobject.list
    elif [ $api = "objectpool" ]; then
        cd  $base/../result
        sed -i '/Benchmark/!d' result-jet-objectpool.list
    elif [ $api = "expression" ]; then
        cd  $base/../result
        sed -i '/Benchmark/!d' result-jet-expression.list
    fi
}

kill -9 $(lsof -t -i:62001)
kill -9 $(lsof -t -i:62002)
kill -9 $(lsof -t -i:62003)
main

