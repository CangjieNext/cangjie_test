# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

#!/bin/bash

rm -rf queryresult.txt mypath.cj

create_dev_if_needed() {
    local dev_type="$1"
    local dev_path="$2"
    local dev_major="$3"
    local dev_minor="$4"

    if [ -e "$dev_path" ]; then
        return 0
    fi

    if [ "$dev_type" = "c" ]; then
        mknod "$dev_path" c "$dev_major" "$dev_minor" 2>/dev/null && return 0
    elif [ "$dev_type" = "b" ]; then
        mknod "$dev_path" b "$dev_major" "$dev_minor" 2>/dev/null && return 0
    fi
    return 1
}

find_device() {
    local dev_type="$1"
    local candidate

    case "$dev_type" in
        c)
            for candidate in /dev/null /dev/zero /dev/urandom /dev/random; do
                if [ -c "$candidate" ]; then
                    echo "$candidate"
                    return 0
                fi
            done
            create_dev_if_needed c /dev/null 1 3 && echo "/dev/null" && return 0
            ;;
        b)
            for candidate in /dev/sda /dev/sda1 /dev/vda /dev/vda1 /dev/nvme0n1 /dev/xvda /dev/xvda1 /dev/loop0 /dev/ram0; do
                if [ -b "$candidate" ]; then
                    echo "$candidate"
                    return 0
                fi
            done
            for i in 0 1 2 3 4 5 6 7; do
                create_dev_if_needed b "/dev/loop$i" 7 "$i" && echo "/dev/loop$i" && return 0
            done
            create_dev_if_needed b /dev/ram0 1 0 && echo "/dev/ram0" && return 0
            ;;
    esac

    find /dev -type "$dev_type" 2>/dev/null | head -n 1
}

firstline=$(find_device "$1")
if [ -z "$firstline" ]; then
    echo "ERROR: no $1 device found under /dev" >&2
    echo var mypath:String=\"\" >mypath.cj
    exit 1
fi

echo var mypath:String=\""$firstline"\" >mypath.cj
