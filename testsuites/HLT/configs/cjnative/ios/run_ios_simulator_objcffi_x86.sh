#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

WORKSPACE=$(cd `dirname $0`; pwd)
XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST=${WORKSPACE}/objc_ffi_test/objc_ffi_test.xcodeproj
XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST=${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST}/../objc_ffi_test
XCODE_SCHEME_OF_CANGJIE_IOS_TEST=objc_ffi_test
XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST=test.objc-ffi-test
XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST=Release
XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST=simulator

interoplib_common=${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_x86_64_cjnative/libinteroplib.common.dylib
interoplib_objc=${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_x86_64_cjnative/libinteroplib.objc.dylib
objc_lang=${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_x86_64_cjnative/libobjc.lang.dylib
cjworld=${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libcjworld.dylib
foundation=${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libobjc.foundation.dylib
dep=${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libdep.dylib

rm -rf ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_x86_64_cjnative
find ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST} \
  -maxdepth 1 \
  -name "*.dylib" \
  -not -name "libobjc.foundation.dylib" \
  -not -name "libdep.dylib" \
  -delete
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
  -not -name "SceneDelegate.h" \
  -not -name "ViewController.h" \
  -delete

cp -f src/objc/*.*  ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}
cp objc-gen/*  ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}
mkdir ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_x86_64_cjnative
cp -r $CANGJIE_HOME/runtime/lib/ios_simulator_x86_64_cjnative/*.dylib ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/ios_x86_64_cjnative/
cp libcjworld.dylib ${cjworld}
# install_name_tool() {
#     command install_name_tool "$@" 2> >(grep -v -E '(Usage:|warning)' >&2)
# }
# codesign() {
#     command xcrun codesign "$@" 2> >(grep -v "is already signed" >&2)
# }
# install_name_tool -id @rpath/libinteroplib.common.dylib ${interoplib_common}
# install_name_tool -id @rpath/libinteroplib.objc.dylib ${interoplib_objc}
# install_name_tool -id @rpath/libobjc.lang.dylib ${objc_lang}
# install_name_tool -id @rpath/libcjworld.dylib ${cjworld}
# install_name_tool -change `otool -L ${interoplib_objc} | grep 'libinteroplib.common.dylib' | awk '{print $1}'` @rpath/libinteroplib.common.dylib ${interoplib_objc}
# install_name_tool -change `otool -L ${objc_lang} | grep 'libinteroplib.common.dylib' | awk '{print $1}'` @rpath/libinteroplib.common.dylib ${objc_lang}
# install_name_tool -change `otool -L ${objc_lang} | grep 'libinteroplib.objc.dylib' | awk '{print $1}'` @rpath/libinteroplib.objc.dylib ${objc_lang}
# install_name_tool -change `otool -L ${cjworld} | grep 'libinteroplib.common.dylib' | awk '{print $1}'` @rpath/libinteroplib.common.dylib ${cjworld}
# install_name_tool -change `otool -L ${cjworld} | grep 'libinteroplib.objc.dylib' | awk '{print $1}'` @rpath/libinteroplib.objc.dylib ${cjworld}
# install_name_tool -change `otool -L ${cjworld} | grep 'libobjc.lang.dylib' | awk '{print $1}'` @rpath/libobjc.lang.dylib ${cjworld}
# codesign --sign - ${cjworld}
if [ -f "libobjc.foundation.dylib" ]; then
    cp libobjc.foundation.dylib ${foundation}
    # install_name_tool -id @rpath/libobjc.foundation.dylib ${foundation}
    # install_name_tool -change `otool -L ${cjworld} | grep 'libobjc.foundation.dylib' | awk '{print $1}'` @rpath/libobjc.foundation.dylib ${cjworld}
    # install_name_tool -change `otool -L ${foundation} | grep 'libinteroplib.common.dylib' | awk '{print $1}'` @rpath/libinteroplib.common.dylib ${foundation}
    # install_name_tool -change `otool -L ${foundation} | grep 'libinteroplib.objc.dylib' | awk '{print $1}'` @rpath/libinteroplib.objc.dylib ${foundation}
    # install_name_tool -change `otool -L ${foundation} | grep 'libobjc.lang.dylib' | awk '{print $1}'` @rpath/libobjc.lang.dylib ${foundation}
    # codesign --sign - ${foundation}
fi
if [ -f "libdep.dylib" ]; then
    cp libdep.dylib ${dep}
    # install_name_tool -id @rpath/libdep.dylib ${dep}
    # install_name_tool -change `otool -L ${cjworld} | grep 'libdep.dylib' | awk '{print $1}'` @rpath/libdep.dylib ${cjworld}
    # install_name_tool -change `otool -L ${dep} | grep 'libinteroplib.common.dylib' | awk '{print $1}'` @rpath/libinteroplib.common.dylib ${dep}
    # install_name_tool -change `otool -L ${dep} | grep 'libinteroplib.objc.dylib' | awk '{print $1}'` @rpath/libinteroplib.objc.dylib ${dep}
    # install_name_tool -change `otool -L ${dep} | grep 'libobjc.lang.dylib' | awk '{print $1}'` @rpath/libobjc.lang.dylib ${dep}
    # codesign --sign - ${dep}
fi

set -e
ret=255
if [ -z ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST} ]; then
    if [ -z "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST}" ]; then
        XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST="iPhone 17"
    fi
    if [ -z ${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST} ]; then
        XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST=26.2
    fi
    python3 ${WORKSPACE}/run_ios.py --objcffi --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --uninstall --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --simulator-name "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST}" --os-version ${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST}
    ret=$?
else
    python3 ${WORKSPACE}/run_ios.py --objcffi --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --uninstall --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --udid ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST}
    ret=$?
fi
exit ${ret}
