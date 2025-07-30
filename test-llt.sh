#!/bin/bash

ROOT_DIR=$(realpath $(dirname "$0")/..)
HOME_DIR=$ROOT_DIR/cangjie_test
TEST_DIR=$HOME_DIR/testsuites/LLT
TEMP_DIR=$HOME_DIR/test_temp
OBJCINTEROPGEN_BUILD_DIR=$ROOT_DIR/cangjie_multiplatform_interop/objc/src/ObjCInteropGen/build

UNAME=$(uname)
if [[ "$UNAME" == "MINGW64"* ]]; then
  CONFIG_NAME=cjnative_test_win
elif [[ "$UNAME" == "Darwin" ]]; then
  if [[ "$(uname -p)" == "arm" ]]; then
    CONFIG_NAME=cjnative_test_darwin_aarch64
  else
    CONFIG_NAME=cjnative_test_darwin
  fi
else
  CONFIG_NAME=cjnative_test
fi

usage() {
  cat <<EOF
Usage: ${0##*/} [-g (current | mine | msbuild)] [<test>]
  -g : ObjCInteropGen to use:
    current : from the current path (default)
    mine    : built with $OBJCINTEROPGEN_BUILD_DIR/build.sh
    msbuild : built remotely from Visual Studio
  <test> : if specified, test or test directory to run (path relative to
           'testsuites/LLT').  By default all tests run.
EOF
  exit 2
}

while getopts "g:" opt; do
  case $opt in
    g)
      case $OPTARG in
        mine)
          export PATH=$OBJCINTEROPGEN_BUILD_DIR/output:$PATH
          ;;
        msbuild)
          export PATH=$OBJCINTEROPGEN_BUILD_DIR/msbuild/Debug.MacOS/bin:$PATH
          ;;
        current)
          ;;
        *)
          usage
          ;;
      esac
      ;;
    *)
      usage
      ;;
  esac
done
shift "$((OPTIND-1))"
if (( $# > 0)); then
  TESTS=$TEST_DIR/$1
  TEST_LIST_ARG=
else
  TESTS=$TEST_DIR
  TEST_LIST_ARG=--test_list=$HOME_DIR/testlist.llt
fi

python3 \
  $ROOT_DIR/cangjie_test_framework/main.py \
  --fail_exit \
  -pFAIL \
  -pPASS \
  --fail-verbose \
  --debug \
  $TESTS \
  --temp_dir=$TEMP_DIR \
  --json_output=$TEMP_DIR/run_result.json \
  --test_cfg=$TEST_DIR/configs/cjnative/$CONFIG_NAME.cfg \
  $TEST_LIST_ARG
