#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

set -e

WORKSPACE=$(cd `dirname $0`; pwd)
if [ ! -z ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} ]; then
    if [ -z ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST} ]; then
        XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST=${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST}/../cangjie.ios.11
    fi
fi
if [ -z ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_SCHEME_OF_CANGJIE_IOS_TEST=cangjie.ios.11
fi
if [ -z ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST=com.cangjie.cangjie-ios-11
fi
if [ -z ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST=device
fi
if [ -z ${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST=iPhone
fi
if [ -z ${XCODE_SIMULATOR_VERSION_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_SIMULATOR_VERSION_OF_CANGJIE_IOS_TEST=15
fi
if [ -z ${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST=17.5
fi
if [ -z ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST=Release
fi
if [ -z ${IOS_DEVICE_MOUNT_DIRECTORY_PATH} ]; then
    IOS_DEVICE_MOUNT_DIRECTORY_PATH=${CANGJIE_TEST}/ios_device
fi
if [ -z ${XCODE_TEMPORARY_PRODUCT_DIRECTORY} ]; then
    XCODE_TEMPORARY_PRODUCT_DIRECTORY=${CANGJIE_TEST}/temp
fi
if [ -z ${XCODE_EXPORT_OPTION_PLIST_PATH} ]; then
    XCODE_EXPORT_OPTION_PLIST_PATH=${WORKSPACE}/exportOptions.plist
fi

# Clean ios working directory and copy everything to remote device
umount ${IOS_DEVICE_MOUNT_DIRECTORY_PATH} &> /dev/null || true
ifuse ${IOS_DEVICE_MOUNT_DIRECTORY_PATH} --documents ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} &> /dev/null || true
/bin/rm -rf ${IOS_DEVICE_MOUNT_DIRECTORY_PATH}/*
cp -rf ./* ${IOS_DEVICE_MOUNT_DIRECTORY_PATH} &> /dev/null || true
umount ${IOS_DEVICE_MOUNT_DIRECTORY_PATH} &> /dev/null || true

for file in *.a; do
    if [ -e "$file" ]; then
        if [[ "$file" == "libcangjie_main.a" ]]; then
            continue
        fi
        ar x $file &> /dev/null || true
    fi
done
ar r libcangjie_main.a *.o &> /dev/null || true

set +e
rm -f ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libcangjie_main.a && cp ./libcangjie_main.a ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libcangjie_main.a
mv ./libcangjie_main.a ./libcangjie_main-bk.a
touch ./libcangjie_main.a && chmod +x ./libcangjie_main.a
echo '#!/bin/sh' > ./libcangjie_main.a
echo 'env > env.txt' >> ./libcangjie_main.a
export PATH=.:$PATH
bash -c "$1" &> /dev/null || true
mv ./libcangjie_main-bk.a ./libcangjie_main.a
envfilepath=$(realpath ./env.txt)
python3 ${WORKSPACE}/run_ios_iphone.py --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --simulator-name "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST} ${XCODE_SIMULATOR_VERSION_OF_CANGJIE_IOS_TEST}" --os-version ${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --udid ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST} --temporary-product-directory ${XCODE_TEMPORARY_PRODUCT_DIRECTORY} --export-option-plist-path ${XCODE_EXPORT_OPTION_PLIST_PATH} --ios-device-mount-path ${IOS_DEVICE_MOUNT_DIRECTORY_PATH} --environment-file $envfilepath
ret=$?

exit $ret