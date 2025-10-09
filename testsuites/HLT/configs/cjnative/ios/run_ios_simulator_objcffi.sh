#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

set -x

WORKSPACE=$(cd `dirname $0`; pwd)
if [ -z ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} ]; then
    XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST=${WORKSPACE}/objc_ffi_test/objc_ffi_test.xcodeproj
    if [ -z ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST} ]; then
        XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST=${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST}/../objc_ffi_test
    fi
fi
if [ -z ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_SCHEME_OF_CANGJIE_IOS_TEST=objc_ffi_test
fi
if [ -z ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST=test.objc-ffi-test
fi
if [ -z ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST=Release
fi
if [ -z ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST=simulator
fi

rm -rf ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_simulator_aarch64_cjnative
rm -rf ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libcjworld*
rm -rf ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/main.m
cp libcjworld.dylib  ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}
cp src/objc/*  ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}
cp objc-gen/*  ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}
cp -r $CANGJIE_HOME/runtime/lib/ios_simulator_aarch64_cjnative ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}
install_name_tool -id @rpath/libinteroplib.objc.dylib ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_simulator_aarch64_cjnative/libinteroplib.objc.dylib
install_name_tool -id @rpath/libobjc-cangjie-isl.dylib ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_simulator_aarch64_cjnative/libobjc-cangjie-isl.dylib
install_name_tool -change libobjc-cangjie-isl.dylib @rpath/libobjc-cangjie-isl.dylib ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_simulator_aarch64_cjnative/libinteroplib.objc.dylib
xcrun codesign --sign - ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_simulator_aarch64_cjnative/*.dylib

ret=255
if [ -z ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST} ]; then
    if [ -z "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST}" ]; then
        XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST="iPhone 15"
    fi
    if [ -z ${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST} ]; then
        XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST=17.5
    fi
    python3 ${WORKSPACE}/run_ios.py --objcffi --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --uninstall --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --simulator-name "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST}" --os-version ${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST}
    ret=$?
else
    python3 ${WORKSPACE}/run_ios.py --objcffi --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --uninstall --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --udid ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST}
    ret=$?
fi
exit ${ret}