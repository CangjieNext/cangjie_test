#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

#!/usr/bin/env bash
set -xe

API="$1"
export WORKSPACE="${WORKSPACE}/code/Cangjie-test"
TESTSUITES="${WORKSPACE}/testsuites/HLT"
BENCHMARK="${TESTSUITES}/Benchmark"
# micro-benchmark根目录。
export MICRO_BENCHMARK="${BENCHMARK}/micro-benchmark"
# 存放micro-benchmark脚本文件的目录。
SCRIPT="${MICRO_BENCHMARK}/script"
# 存放所有测试清单的目录。
TESTLIST="${SCRIPT}/testlist"
# 本次将执行的java用例清单。
TESTLIST_JAVA="${TESTLIST}/testlist-java-${API}"
# 存放所有测试结果的目录。
RESULT="${SCRIPT}/result"
# 本次执行java用例的测试结果所保存的文件。
RESULT_JAVA_LIST="${RESULT}/result-java-${API}.list"

# 存放待测API的所有java用例的目录。
JAVA_CASE_DIR="${MICRO_BENCHMARK}/java/${API}"

# java编译器命令。
JAVAC="javac"

# java虚拟机命令。
JAVA="java"
JAVA+=" -Xms512m"
JAVA+=" -Xmx16g"

function cffi_benchmark() {
  # 用于存放所有编译得到的class文件。
  TMP="${JAVA_CASE_DIR}/tmp"
  mkdir -p "${TMP}"
  JAVAC+=" -d ${TMP}"
  JAVA+=" -cp ${TMP}"

  JNI_H_DIR="${JAVA_HOME}/include"
  JNI_MD_H_DIR="${JAVA_HOME}/include/linux"

  CXX="clang"
  CXX_FLAGS=" -shared"
  CXX_FLAGS+=" -fPIC"
  CXX_FLAGS+=" -I ${JAVA_CASE_DIR}"
  CXX_FLAGS+=" -I ${JNI_H_DIR}"
  CXX_FLAGS+=" -I ${JNI_MD_H_DIR}"

  while read -r CASE_NAME; do
    if [ -f "${JAVA_CASE_DIR}/${CASE_NAME}.c" ]; then
      ${CXX} ${CXX_FLAGS} ${JAVA_CASE_DIR}/${CASE_NAME}.c -o ${TMP}/lib${CASE_NAME}.so
    fi

    ${JAVAC} ${JAVA_CASE_DIR}/${CASE_NAME}.java
    export LD_LIBRARY_PATH="${TMP}:${LD_LIBRARY_PATH}"
    export LD_LIBRARY_PATH="$(pwd):${LD_LIBRARY_PATH}"
    RESULT=$(timeout 1200 ${JAVA} ${CASE_NAME})

    if [ -n "${RESULT}" ]; then
      echo "${RESULT}" >> "${RESULT_JAVA_LIST}"
    else
      printf "[ERROR] Failed to run %s\n" "${CASE_NAME}"
    fi
  done < "${TESTLIST_JAVA}"
}

function jmh_benchmark() {
  JMH="${MICRO_BENCHMARK}/jmh_microbenchmark"
  rm -rf "${JMH}/src/main/java/org/sample"/*
  while IFS= read -r CASE_NAME; do
    cp "${MICRO_BENCHMARK}/java/${API}/${CASE_NAME}.java" "${JMH}/src/main/java/org/sample"
  done < "${TESTLIST_JAVA}"
  if [[ "${API}" == "log" ]]; then
    rm -rf "${JMH}/src/main/resources"
    mkdir "${JMH}/src/main/resources"
    cp "${MICRO_BENCHMARK}/java/${API}/log4j2.xml" "${JMH}/src/main/resources"
  fi

  cd "${JMH}" || exit
  mvn clean verify

  #CLASS_PATH="${JMH}/target/benchmarks.jar"
  CLASS_PATH=""
  if [[ "${API}" == "json" ]]; then
    CLASS_PATH+=":${GSON}"
  fi
  if [[ "${API}" == "client_http" ]]; then
    CLASS_PATH+=":${OKHTTP}:${OKIO}"
  fi
  if [[ "${API}" == "client_https" ]]; then
    CLASS_PATH+=":${OKHTTP}:${OKIO}"
  fi
  if [[ "${API}" == "client_http2" ]]; then
    CLASS_PATH+=":${OKHTTP}:${OKIO}"
  fi
  if [[ "${API}" == "http" ]]; then
    CLASS_PATH+=":${OKHTTP}:${OKIO}"
  fi
  if [[ "${API}" == "https" ]]; then
    CLASS_PATH+=":${OKHTTP}:${OKIO}"
  fi
  if [[ "${API}" == "log" ]]; then
    CLASS_PATH+=":${LOG4JCORE}:${LOG4JAPI}"
  fi
  ${JAVA} -cp "${CLASS_PATH}" "org.openjdk.jmh.Main" -rf json
  python3 "${MICRO_BENCHMARK}/script/run/JMH_analyzer.py" "${JMH}/jmh-result.json" &> "${RESULT_JAVA_LIST}"
}

function httpserver_benchmark() {
  while read -r CASE_NAME; do
    cd ${MICRO_BENCHMARK}/java
    ${JAVAC} -cp . ${JAVA_CASE_DIR}/${CASE_NAME}.java 
    ${JAVA} -cp . ${API}/${CASE_NAME} &
    sleep 10
  done < "${TESTLIST_JAVA}"
}

function java_http_filter() {
  java_http_list="${RESULT}/result-java-http.list"
  sed -i 's/0_2048/0_2K/g' "${java_http_list}"
  sed -i 's/0_16384/0_16K/g' "${java_http_list}"
  sed -i 's/0_131072/0_128K/g' "${java_http_list}"
  sed -i 's/0_1048576/0_1M/g' "${java_http_list}"
  sed -i 's/0_8388608/0_8M/g' "${java_http_list}"
  sed -i 's/0_67108864/0_64M/g' "${java_http_list}"

  sed -i 's/Form_N_32/Form32_0/g' "${java_http_list}"
  sed -i 's/Form_N_256/Form256_0/g' "${java_http_list}"
  sed -i 's/Form_N_2048/Form2K_0/g' "${java_http_list}"
  sed -i 's/Form_N_16384/Form16K_0/g' "${java_http_list}"
  sed -i 's/Form_N_131072/Form128K_0/g' "${java_http_list}"
  sed -i 's/Form_N_1048576/Form1M_0/g' "${java_http_list}"
  sed -i 's/Form_N_8388608/Form8M_0/g' "${java_http_list}"
  sed -i 's/Form_N_67108864/Form64M_0/g' "${java_http_list}"

  sed -i 's/_Req_32/32_0/g' "${java_http_list}"
  sed -i 's/_Req_256/256_0/g' "${java_http_list}"
  sed -i 's/_Req_2048/2K_0/g' "${java_http_list}"
  sed -i 's/_Req_16384/16K_0/g' "${java_http_list}"
  sed -i 's/_Req_131072/128K_0/g' "${java_http_list}"
  sed -i 's/_Req_1048576/1M_0/g' "${java_http_list}"
}

function java_https_filter() {
  java_http_list="${RESULT}/result-java-https.list"
  sed -i 's/0_2048/0_2K/g' "${java_http_list}"
  sed -i 's/0_16384/0_16K/g' "${java_http_list}"
  sed -i 's/0_131072/0_128K/g' "${java_http_list}"
  sed -i 's/0_1048576/0_1M/g' "${java_http_list}"
  sed -i 's/0_8388608/0_8M/g' "${java_http_list}"
  sed -i 's/0_67108864/0_64M/g' "${java_http_list}"

  sed -i 's/Form_N_32/Form32_0/g' "${java_http_list}"
  sed -i 's/Form_N_256/Form256_0/g' "${java_http_list}"
  sed -i 's/Form_N_2048/Form2K_0/g' "${java_http_list}"
  sed -i 's/Form_N_16384/Form16K_0/g' "${java_http_list}"
  sed -i 's/Form_N_131072/Form128K_0/g' "${java_http_list}"
  sed -i 's/Form_N_1048576/Form1M_0/g' "${java_http_list}"
  sed -i 's/Form_N_8388608/Form8M_0/g' "${java_http_list}"
  sed -i 's/Form_N_67108864/Form64M_0/g' "${java_http_list}"

  sed -i 's/_Req_32/32_0/g' "${java_http_list}"
  sed -i 's/_Req_256/256_0/g' "${java_http_list}"
  sed -i 's/_Req_2048/2K_0/g' "${java_http_list}"
  sed -i 's/_Req_16384/16K_0/g' "${java_http_list}"
  sed -i 's/_Req_131072/128K_0/g' "${java_http_list}"
  sed -i 's/_Req_1048576/1M_0/g' "${java_http_list}"
}

function jmh_xml_benchmark() {
  JMH="${MICRO_BENCHMARK}/jmh_microbenchmark"
  rm -rf "${JMH}/src/main/java/org/sample"/*
  while IFS= read -r CASE_NAME; do
    cp "${MICRO_BENCHMARK}/java/${API}/${CASE_NAME}.java" "${JMH}/src/main/java/org/sample"
  done < "${TESTLIST_JAVA}"

  cd "${JMH}" || exit
  mvn clean verify

  CLASS_PATH="${JMH}/target/benchmarks.jar"
  ${JAVA} -cp "${CLASS_PATH}" "org.openjdk.jmh.Main" -rf json
  python3 "${MICRO_BENCHMARK}/script/run/JMH_analyzer_xml.py" "${JMH}/jmh-result.json" &> "${RESULT_JAVA_LIST}"
}

case "${API}" in
  "array")
    printf "benchmarking java-array\n"
    jmh_benchmark
    ;;
  "atomic")
    printf "benchmarking java-atomic\n"
    jmh_benchmark
    ;;
  "json")
    printf "benchmarking java-json\n"
    jmh_benchmark
    ;;
  "cffi")
    printf "benchmarking java-cffi\n"
    cffi_benchmark
    ;;
  "expression")
    printf "benchmarking java-expression\n"
    jmh_benchmark
    ;;
  "regex")
    printf "benchmarking java-regex\n"
    jmh_benchmark
    ;;
  "string")
    printf "benchmarking java-string\n"
    jmh_benchmark
    ;;
  "stringbuilder")
    printf "benchmarking java-stringbuilder\n"
    jmh_benchmark
    ;;
  "convert")
    printf "benchmarking java-convert\n"
    jmh_benchmark
    ;;
  "collections_arraylist")
    printf "benchmarking java-collections_arraylist\n"
    jmh_benchmark
    ;;
  "collections_hashmap")
    printf "benchmarking java-collections_hashmap\n"
    jmh_benchmark
    ;;
  "collections_hashset")
    printf "benchmarking java-collections_hashset\n"
    jmh_benchmark
    ;;
  "collections_arraydeque")
    printf "benchmarking java-collections_arraydeque\n"
    jmh_benchmark
    ;;
  "collections_blockingqueue")
    printf "benchmarking java-collections_blockingqueue\n"
    jmh_benchmark
  ;;
  "collections_linkedlist")
    printf "benchmarking java-collections_linkedlist\n"
    jmh_benchmark
  ;;
  "collections_treemap")
    printf "benchmarking java-collections_treemap\n"
    jmh_benchmark
  ;;
  "collections_treeset")
    printf "benchmarking java-collections_treeset\n"
    jmh_benchmark
  ;;
  "collections_cmap")
    printf "benchmarking java-collections_cmap\n"
    jmh_benchmark
    ;;
  "reflect")
    printf "benchmarking java-reflect\n"
    jmh_benchmark
    ;;
  "url")
    printf "benchmarking java-url\n"
    jmh_benchmark
    ;;
  "io")
    printf "benchmarking java-io\n"
    jmh_benchmark
    ;;
  "xml")
    printf "benchmarking java-xml\n"
    jmh_xml_benchmark
    ;;
  "client_http")
    printf "benchmarking java-client_http\n"
    jmh_benchmark
    ;;
  "client_https")
    printf "benchmarking java-client_https\n"
    jmh_benchmark
    ;;
  "client_http2")
    printf "benchmarking java-client_http2\n"
    jmh_benchmark
    ;;
  "http")
    printf "benchmarking java-http\n"
    jmh_benchmark
    java_http_filter
    ;;
  "https")
    printf "benchmarking java-https\n"
    jmh_benchmark
    java_https_filter
    ;;
  "server_http")
    printf "benchmarking java-server_http\n"
    httpserver_benchmark
    cd  "$RESULT/../run"
    bash $RESULT/../run/server_http.sh java
    kill -9 $(lsof -t -i:62001)
    echo "http server stopped"
    ;;
  "server_https")
    printf "benchmarking java-server_https\n"
    httpserver_benchmark
    cd  "$RESULT/../run"
    bash $RESULT/../run/server_https.sh java
    kill -9 $(lsof -t -i:62002)
    echo "https server stopped"
    ;;
  "log")
    printf "benchmarking java-log\n"
    jmh_benchmark
    ;;
  "lambda")
    printf "benchmarking java-lambda\n"
    jmh_benchmark
    ;;
  *)
    printf "${API} benchmark has not been implemented yet.\n"
    exit
    ;;
esac