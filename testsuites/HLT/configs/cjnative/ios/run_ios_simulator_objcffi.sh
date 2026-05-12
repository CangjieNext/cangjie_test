#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

WORKSPACE=$(cd `dirname $0`; pwd)
TARGET=$1
XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST=${WORKSPACE}/objc_ffi_test/objc_ffi_test.xcodeproj
XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST=${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST}/../objc_ffi_test
XCODE_SCHEME_OF_CANGJIE_IOS_TEST=objc_ffi_test
XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST=test.objc-ffi-test
XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST=Release
XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST=simulator

cjworld=${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libcjworld.dylib
foundation=${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libobjc.foundation.dylib
dep=${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libdep.dylib

# rm -rf ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_aarch64_cjnative
# find ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST} \
#   -maxdepth 1 \
#   -name "*.dylib" \
#   -not -name "libobjc.foundation.dylib" \
#   -not -name "libdep.dylib" \
#   -delete
find ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST} \
  -maxdepth 1 \
  -name "*.m" \
  -not -name "AppDelegate.m" \
  -not -name "SceneDelegate.m" \
  -not -name "ViewController.m" \
  -delete
find ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST} \
  -maxdepth 1 \
  -name "*.h" \
  -not -name "AppDelegate.h" \
  -not -name "Cangjie.h" \
  -not -name "SceneDelegate.h" \
  -not -name "ViewController.h" \
  -delete

cp -f src/objc/*.*  ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}
cp objc-gen/*  ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}
mkdir -p ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_aarch64_cjnative
cp -r $CANGJIE_HOME/runtime/lib/$TARGET/*.dylib ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_aarch64_cjnative/
cp libcjworld.dylib ${cjworld}
if [ -f "libobjc.foundation.dylib" ]; then
    cp libobjc.foundation.dylib ${foundation}
fi
if [ -f "libdep.dylib" ]; then
    cp libdep.dylib ${dep}
fi

set -e
ret=255
if [ -z ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST} ]; then
    if [ -z "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST}" ]; then
        XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST="iPhone 17"
    fi
    if [ -z ${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST} ]; then
        XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST=26.0.1
    fi
    python3 ${WORKSPACE}/run_ios.py --objcffi --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --uninstall --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --simulator-name "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST}" --os-version ${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST}
    ret=$?
else
    python3 ${WORKSPACE}/run_ios.py --objcffi --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --uninstall --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --udid ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST}
    ret=$?
fi
exit ${ret}
