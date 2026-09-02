#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#
# Compile a direct iOS simulator executable and run it via simctl spawn, without going through xcodebuild.
# Usage:
#   run_ios_executable.sh --cj <main.cj> [--udid <udid>] [--arch arm64|x86_64] [--static]
 
set -e
 
CANGJIE_HOME="${CANGJIE_HOME:-$(dirname "$(dirname "$(readlink -f "$0")")")/../../..}"
 
ARCH="arm64"
CJ_SRC=""
UDID=""
STATIC=""
 
while [ $# -gt 0 ]; do
    case "$1" in
        --cj) CJ_SRC="$2"; shift 2 ;;
        --udid) UDID="$2"; shift 2 ;;
        --arch) ARCH="$2"; shift 2 ;;
        --static) STATIC=1; shift ;;
        *) echo "unknown arg: $1"; exit 2 ;;
    esac
done
 
if [ -z "$CJ_SRC" ]; then
    echo "Error: --cj <main.cj> is required"
    exit 2
fi
 
if [ "$ARCH" = "arm64" ]; then
    SUBDIR="ios_simulator_aarch64"
else
    SUBDIR="ios_simulator_x86_64"
fi
 
SDK="$(xcrun --sdk iphonesimulator --show-sdk-path)"
TOOLCHAIN="$(dirname "$(xcrun --find clang)")"
RUNTIME_LIB="$CANGJIE_HOME/runtime/lib/${SUBDIR}_cjnative"
MODULES="$CANGJIE_HOME/modules/${SUBDIR}_cjnative"
OUT="$(basename "$CJ_SRC" .cj)_sim_bin"
 
export DYLD_LIBRARY_PATH="$CANGJIE_HOME/runtime/lib/darwin_aarch64_cjnative:$CANGJIE_HOME/tools/lib:$DYLD_LIBRARY_PATH"
export PATH="$CANGJIE_HOME/bin:$PATH"
 
echo "compiling $CJ_SRC -> $OUT (arch=$ARCH)"
CJ_OPTS=(
    --import-path "$MODULES"
    --target="arm64-apple-ios-simulator"
    --sysroot="$SDK"
    -B"$TOOLCHAIN"
    --output-type=exe
)
[ -n "$STATIC" ] && CJ_OPTS+=(--static --static-std)
 
cjc "${CJ_OPTS[@]}" "$CJ_SRC" -o "$OUT"
 
codesign -f -s - "$OUT"
 
if [ -z "$UDID" ]; then
    UDID="$(xcrun simctl list devices booted -j | /usr/bin/python3 -c "import sys,json;d=json.load(sys.stdin);print(next((dev['udid'] for rt in d['devices'].values() for dev in rt if dev.get('state')=='Booted'),''))")"
fi
if [ -z "$UDID" ]; then
    echo "Error: no booted simulator, pass --udid"
    exit 2
fi
 
echo "running on simulator $UDID"
if [ -n "$STATIC" ]; then
    xcrun simctl spawn "$UDID" "./$OUT"
else
    SIMCTL_CHILD_DYLD_LIBRARY_PATH="$RUNTIME_LIB" xcrun simctl spawn "$UDID" "./$OUT"
fi
exit $?