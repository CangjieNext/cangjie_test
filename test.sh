#!/bin/bash

ROOT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/..
HOME_DIR=$ROOT_DIR/cangjie_test
TEST_DIR=$HOME_DIR/testsuites/HLT
TEMP_DIR=$HOME_DIR/test_temp

OBJCINTEROPGEN_BUILD_DIR=$ROOT_DIR/cangjie_multiplatform_interop/objc/src/ObjCInteropGen/build

usage() {
  cat <<EOF
Usage: ${0##*/} [-g (current | mine | msbuild)] [-p (macos | ios)] [-a | <test>]
  -g : ObjCInteropGen to use:
    current : from the current path (default)
    mine    : built with $OBJCINTEROPGEN_BUILD_DIR/build.sh
    msbuild : built remotely from Visual Studio
  -p : platform:
    macos : macOS (default)
    ios   : iOS simulator
  -a : run all tests, ignoring exclude list
  <test> : if specified, test or test directory to run (path relative to
           'testsuites/HLT').  By default, all tests run except exclude list.
EOF
  exit 2
}

while getopts "g:p:a" opt; do
  case $opt in
    g)
      case $OPTARG in
        mine)
          export PATH=$OBJCINTEROPGEN_BUILD_DIR/output:$PATH/bin
          ;;
        msbuild)
          export PATH=$OBJCINTEROPGEN_BUILD_DIR/msbuild/Debug.MacOS/bin:$PATH/bin
          ;;
        current)
          ;;
        *)
          usage
          ;;
      esac
      ;;
    p)
      case $OPTARG in
        ios)
          PLATFORM=mac_aarch64-ios_simulator_aarch64
          ;;
        macos)
          PLATFORM=mac_aarch64-mac_aarch64
          ;;
        *)
          usage
          ;;
      esac
      ;;
    a)
      IGNORE_EXCLUDE_LIST=1
      ;;
    *)
      usage
      ;;
  esac
done

if [[ -z "${PLATFORM:-}" ]]; then
  PLATFORM=mac_aarch64-mac_aarch64
fi

CONFIG_DIR=$TEST_DIR/configs/cjnative/$PLATFORM

shift "$((OPTIND-1))"
if (( $# > 0)); then
  TESTS=$TEST_DIR/$TESTS
  TEST_LIST=
else
  TESTS=$TEST_DIR
  TEST_LIST=--test_list=$HOME_DIR/testlist
  if ! (( IGNORE_EXCLUDE_LIST )); then
    TEST_LIST=$TEST_LIST,$CONFIG_DIR/exclude_common
  fi
fi

export CANGJIE_TEST=$HOME_DIR
export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
export XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST="iPhone 15"
export XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST=17.5

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
  --timeout=600 \
  --test_cfg=$CONFIG_DIR/objc.cfg \
  $TEST_LIST
