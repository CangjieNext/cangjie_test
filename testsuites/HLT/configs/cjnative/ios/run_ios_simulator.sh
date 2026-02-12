#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

set +xe

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

# add env for testcase used to test trace on ios, default true
if [ -z ${IS_UNINSTALL_ON_SIMULATOR} ]; then
    IS_UNINSTALL_ON_SIMULATOR=true
fi

echo "递归提取并合并所有 .a 文件..."

# 创建临时目录
TEMP_DIR="$(pwd)/merge_temp"
mkdir -p "$TEMP_DIR"

# 递归查找并处理所有 .a 文件（排除目标文件）
find . -name "*.a" -type f | grep -v "libcangjie_main.a" | while read -r file; do
    echo "提取: $file"
    
    # 在文件所在目录执行提取
    (cd "$(dirname "$file")" && ls -la && ar x "$(basename "$file")" && mv *.o "$TEMP_DIR/" 2>/dev/null || true)
done

# 合并所有 .o 文件
if [ "$(ls -A "$TEMP_DIR"/*.o 2>/dev/null)" ]; then
    echo "合并对象文件到 libcangjie_main.a"
    ar r libcangjie_main.a "$TEMP_DIR"/*.o &> /dev/null || true
else
    echo "没有找到可合并的 .o 文件"
fi

# 清理
rm -rf "$TEMP_DIR"
echo "完成"

rm -f ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libcangjie_main.a
cp libcangjie_main.a ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libcangjie_main.a

ret=255
if [ -z ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST} ]; then
    if [ -z "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST}" ]; then
        XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST="iPhone 15"
    fi
    if [ -z ${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST} ]; then
        XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST=17.5
    fi
    if [ "${IS_UNINSTALL_ON_SIMULATOR}" = "true" ]; then
        python3 ${WORKSPACE}/run_ios.py --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --uninstall --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --simulator-name "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST}" --os-version ${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST}
    else
        python3 ${WORKSPACE}/run_ios.py --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --simulator-name "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST}" --os-version ${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST}
    fi
    ret=$?
else
    if [ "${IS_UNINSTALL_ON_SIMULATOR}" = "true" ]; then
        python3 ${WORKSPACE}/run_ios.py --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --uninstall --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --udid ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST}
    else
        python3 ${WORKSPACE}/run_ios.py --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --udid ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST}
    fi
    ret=$?
fi
exit ${ret}