#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#
# Direct-executable route on a REAL iOS device: no xcodebuild / .xcodeproj /
# C bridging, the on-device counterpart of run_ios_simulator_executable.sh.
# Prerequisite: the test case has been compiled into a device executable by
# cjc --output-type=exe (see the mac_aarch64-ios_aarch64_exe cfg series, where
# output = main, so the artifact in the working directory always has the fixed
# name ./main). Cases are compiled unmodified: no modify_cj_file_for_ios.py
# rewriting, the case's own main() stays the app entry (so the exit code
# mirrors what the same case reports on Linux/macOS). The exit code comes
# from devicectl --console's exit-status line (parsed in resolve_exit_code);
# a cj_main_return marker is still honored when a cfg re-adds the modify
# wrapper (compat with idevicedebug on older Xcode).
#
# The framework runs in work_dir, $1 looks like "%run %output %run_args",
# which expands to "export ... && main <args>". This script wraps ./main into
# a minimal main.app (Info.plist + embedded.mobileprovision, no xcodebuild),
# bundles its dynamic library dependencies into main.app/Frameworks with
# @rpath, signs everything with the development identity, installs via
# `xcrun devicectl device install app`, launches with stdout capture, prints
# the case stdout (everything before the exit-code marker, byte-exact) and
# returns the case exit code to the framework. One-time setup variables are
# documented in ios_device_common.sh.
#
# NOTE: all cases share the connected device, and a profile with a fixed
# bundle id means every case installs over the same app -- disable framework
# parallelism for device runs, or provision a wildcard profile (each case
# then gets a per-work_dir bundle id and cannot clobber other cases).

set +x
set -e

WORKSPACE=$(cd `dirname $0`; pwd)

# Source the common utility functions
source "$WORKSPACE/ios_device_common.sh"

require_cangjie_home

# Extract the executable name and arguments from $1
# Example of $1: "export DYLD_LIBRARY_PATH=... && main arg1 arg2"
RUN_CMD="$1"
ACTUAL="${RUN_CMD##*&&}"
ACTUAL="${ACTUAL## }"
EXE="$(echo "$ACTUAL" | awk '{print $1}')"
EXE="${EXE#./}"
ARGS="$(echo "$ACTUAL" | awk '{$1=""; print $0}' | sed 's/^ *//')"

if [ -z "$EXE" ] || [ ! -f "$EXE" ]; then
    echo "Error: cannot find executable '$EXE' in $(pwd)" >&2
    exit 255
fi

TMP_WORK=$(mktemp -d /tmp/cj_ios_device.XXXXXX)
trap 'rm -rf "$TMP_WORK"' EXIT

PROFILE="${IOS_DEVICE_PROVISION_PROFILE:-}"
prepare_signing "$PROFILE" "$TMP_WORK" || exit 255

UDID=$(get_device_udid) || exit 255
echo "target device: $UDID" >&2

# Assemble the minimal .app bundle in the work_dir.
APP_DIR="$(pwd)/main.app"
rm -rf "$APP_DIR"
mkdir -p "$APP_DIR/Frameworks"
cp "$EXE" "$APP_DIR/main"
generate_info_plist "$APP_DIR/Info.plist"
cp "$PROFILE" "$APP_DIR/embedded.mobileprovision"
printf 'APPL????' > "$APP_DIR/PkgInfo"

# Bundle dynamic dependencies (cangjie runtime, stdx, case-local glue dylibs)
# into the app and point them at @rpath so dyld resolves them in Frameworks.
bundle_dylib_deps "$APP_DIR/main" "$APP_DIR/Frameworks"
add_bundle_rpath "$APP_DIR/main"

# Sign nested code first, then seal the bundle (real devices reject ad-hoc
# signing, unlike the simulator route).
sign_bundle "$APP_DIR" "$SIGN_IDENTITY" "$TMP_WORK/entitlements.plist" || exit 255

echo "installing $APP_DIR on device $UDID" >&2
xcrun devicectl device install app --device "$UDID" "$APP_DIR" >&2 || exit 255

OUT="$TMP_WORK/console_out.txt"
set +e
launch_and_capture "$UDID" "$BUNDLE_ID" "$OUT" $ARGS
LAUNCH_RC=$?
set -e

# Case stdout for the framework: with a cj_main_return marker present (a cfg
# that re-adds the modify wrapper) everything before the marker is passed
# through, byte-exact; without one the whole console stream is the case
# output. devicectl's own chatter lines -- including the trailing
# exit-status line -- are dropped by filter_chatter either way.
if grep -q 'cj_main_return_start' "$OUT"; then
    sed -n '1,/cj_main_return_start/p' "$OUT" |
        sed 's/cj_main_return_start.*$//' |
        filter_chatter
else
    filter_chatter < "$OUT"
fi

RET=$(resolve_exit_code "$OUT" "$LAUNCH_RC")
echo "device run exit code: $RET (channel: $USED_LAUNCH_MODE)" >&2
exit "$RET"
