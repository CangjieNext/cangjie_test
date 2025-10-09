#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

set +e

WORKSPACE=$(cd `dirname $0`; pwd)
if [ -z ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} ]; then
    XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST=${WORKSPACE}/xcode_project_of_cangjie_ios_test/test_cangjie_ios_175.xcodeproj
    if [ -z ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST} ]; then
        XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST=${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST}/../test_cangjie_ios_175/bridge_cangjie
    fi
fi
if [ -z ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_SCHEME_OF_CANGJIE_IOS_TEST=test_cangjie_ios_175
fi
if [ -z ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST=cangjie.test-cangjie-ios-175
fi
if [ -z ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST=Release
fi
if [ -z ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST=simulator
fi

for file in *.a; do
    if [ -e "$file" ]; then
        if [[ "$file" == "libcangjie_main.a" ]]; then
            continue
        fi
        ar x $file &> /dev/null || true
    fi
done
ar r libcangjie_main.a *.o &> /dev/null || true

rm -f ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libcangjie_main.a
# To cp $1 ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libcangjie_main.a
cp libcangjie_main.a ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libcangjie_main.a

ret=255
if [ -z ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST} ]; then
    if [ -z "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST}" ]; then
        XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST="iPhone 15"
    fi
    if [ -z ${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST} ]; then
        XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST=17.5
    fi
    python3 ${WORKSPACE}/run_ios.py --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --uninstall --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --simulator-name "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST}" --os-version ${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST}
    ret=$?
else
    python3 ${WORKSPACE}/run_ios.py --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --uninstall --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --udid ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST}
    ret=$?
fi
exit ${ret}