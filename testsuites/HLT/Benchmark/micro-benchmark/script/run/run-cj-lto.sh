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
    import_cangjie_stdx="-L$CANGJIE_STDX_PATH -lstdx.encoding.json -lstdx.serialization.serialization -lstdx.serialization -lstdx.net.http -lstdx.net.tls -lstdx.net.tls.common -lstdx.net -lstdx.logger -lstdx.log -lstdx.encoding.url -lstdx.encoding.json.stream -lstdx.crypto.keys -lstdx.crypto.x509 -lstdx.crypto.common -lstdx.crypto.kit -lstdx.encoding.hex -lstdx.encoding.base64 -lstdx.encoding -lstdx.crypto.crypto -lstdx.crypto.digest -lstdx.crypto -lstdx.compress.zlib -lstdx.compress -lstdx --import-path $CANGJIE_STDX_PATH -ldl"
else
    import_cangjie_stdx=
fi

opt="-O2 --int-overflow=wrapping --no-sub-pkg $import_cangjie_stdx"
result_log="$base/result-lto-${api}.list"
lto="--lto=full"
export cjHeapSize=16gb
export cjStackSize=64mb

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
    result="result-lto-${api}.list"
    benchmark=$1
    cjc ${benchmark}.cj $opt $lto -o ${benchmark}.out
    res=`timeout 1800 ./${benchmark}.out`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_objectpool_benchmark() {
    mod="$base/../../cj/$api"
    cd $mod
    result="result-lto-${api}.list"
    benchmark=$1
    cjc ${benchmark}.cj --test $opt $lto -o ${benchmark}.out
    res=`timeout 1800 ./${benchmark}.out --no-progress --reportFormat=xml --reportPath=./tmpfile`
    rm -rf ./tmpfile
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_reflect_benchmark() {
    mod="$base/../../cj/$api"
    cd $mod
    result="result-lto-${api}.list"
    benchmark=$1
    cjc benchmark_classes.cj ${benchmark}.cj --test $opt $lto -o ${benchmark}.out
    res=`timeout 1800 ./${benchmark}.out --bench --no-color`
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
    cjc ${benchmark}.cj $opt $lto -o ${benchmark}.out
    timeout 1800 ./${benchmark}.out &
    echo "${benchmark} started."
}

function run_string_benchmark() {
    mod="$base/../../cj/$api"
    cd $mod
    result="result-lto-${api}.list"
    benchmark=$1
    cjc ${benchmark}.cj $opt $lto -o ${benchmark}.out --test
    res=`timeout 1800 ./${benchmark}.out --bench --no-color`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_ast_benchmark() {
    mod="$base/../../cj/$api"
    cd $mod
    result="result-lto-${api}.list"
    benchmark=$1
    cjc ${benchmark}.cj inputs.cj utils.cj visitors.cj $opt $lto -o ${benchmark}.out --test
    res=`timeout 1800 ./${benchmark}.out --bench --no-color`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_cffi_benchmark() {
    cd "$base/../../cj/cffi"
    result="result-lto-cffi.list"
    benchmark=$1
    clang -shared -fPIC ${benchmark}.c -o lib${benchmark}.so
    cjc --error-count-limit=all -L . -l ${benchmark} ${benchmark}.cj $opt $lto -o ${benchmark}.out
    res=`timeout 1800 ./${benchmark}.out`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_collections_hashset_benchmark() {
    cd "$base/../../cj/collections_hashset"
    result="result-lto-collections_hashset.list"
    benchmark=$1
    cjc ${benchmark}.cj common_collection.cj $opt $lto -o ${benchmark}.out
    res=`timeout 1800 ./${benchmark}.out`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_regex_benchmark() {
    cd "$base/../../cj/regex"
    result="result-lto-regex.list"
    benchmark=$1
    cjc ${benchmark}.cj generateRegexData.cj $opt $lto -o ${benchmark}.out
    res=`timeout 1800 ./${benchmark}.out`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_serialize_benchmark(){
    cd "$base/../../cj/serialize"
    result="result-lto-serialize.list"
    benchmark=$1
    cjc *.cj $opt $lto -o ${benchmark}.out
    res=`timeout 1800 ./${benchmark}.out`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_concurrency_benchmark(){
    cd "$base/../../cj/concurrency"
    result="result-lto-concurrency.list"
    benchmark=$1
    cjc ${benchmark}.cj Concurrency.cj WaitGroup.cj $opt $lto -o ${benchmark}.out
    res=`timeout 1800 ./${benchmark}.out`
    if [ -n "$res" ]; then
        echo "$res" >> "$base/$result"
    else
        echo "Error: ${benchmark} failed to run."
    fi
}

function run_atomic_aarch64_benchmark(){
    result="result-lto-atomic.list"
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

    if [[ "${optimized[@]}" =~ $benchmark ]]; then
        if [[ $(uname -m) == "aarch64" ]]; then
            cjc ${benchmark}.cj $opt $lto --target-cpu=tsv110 --experimental -o ${benchmark}.out
        else
            cjc ${benchmark}.cj $opt $lto -o ${benchmark}.out
        fi
    elif [[ ! "${optimized[@]}" =~ $benchmark ]]; then
        cjc ${benchmark}.cj $opt $lto -o ${benchmark}.out
    fi
    res=`timeout 1800 ./${benchmark}.out`
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

    sort $base/unsorted.list | uniq > $base/result-lto-${api}.list

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
        bash $base/../run/server_http.sh lto
        kill -9 $(lsof -t -i:62001)
        echo "http server stopped"
    elif [ $api = "server_https" ]; then
        cd  $base/../run
        bash $base/../run/server_https.sh lto
        kill -9 $(lsof -t -i:62002)
        echo "https server stopped"
    elif [ $api = "server_http2" ]; then
        cd  $base/../run
        bash $base/../run/server_http2.sh lto
        kill -9 $(lsof -t -i:62003)
        echo "http2 server stopped"
    elif [ $api = "createobject" ]; then
        cd  $base/../result
        sed -i '/Benchmark/!d' result-lto-createobject.list
    elif [ $api = "objectpool" ]; then
        cd  $base/../result
        sed -i '/Benchmark/!d' result-lto-objectpool.list
    elif [ $api = "expression" ]; then
        cd  $base/../result
        sed -i '/Benchmark/!d' result-lto-expression.list
    fi
}

kill -9 $(lsof -t -i:62001)
kill -9 $(lsof -t -i:62002)
kill -9 $(lsof -t -i:62003)
main

