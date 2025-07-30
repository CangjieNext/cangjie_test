#!/bin/bash

test() {
  local result_file=$1
  shift
  ./test.sh $* 2>&1 | tee $result_file.txt
  awk '{ if ($2 == "Case:") print $3, $4, $5; else if ($1 == "TestSuiteTask:") print "\n" $3, $4, $5, $6, $7, $8; }' \
    $result_file.txt \
    > $result_file-summary.txt
}

rm -rf ../cangjie_test_framework/test_temp test_temp

test Log-macos
test Log-ios -p ios
test Log-macos-all -a
test Log-ios-all -p ios -a
