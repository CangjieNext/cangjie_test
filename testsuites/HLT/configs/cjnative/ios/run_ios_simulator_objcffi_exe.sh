#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#
# Direct-executable route for ObjC interop cases (no xcodebuild / .app / C bridging).
# Counterpart of run_ios_simulator_objcffi.sh for the *_exe series cfg (objc.cfg /
# objc_O2.cfg / objc_static.cfg).
#
# On the simulator, the test.info final-link line "(iOSNative and not iOS) EXEC:
# %clang %cangjie_runtime_link ... -o %output" never runs: the condition set of the
# iOS simulator cfg contains both iOSNative and iOS, so "not iOS" is false. This
# runner takes over that final link:
#
#   1. Link the simulator executable: src/objc/*.m + objc-gen/*.o + work_dir
#      Cangjie dylibs (libcjworld.dylib, libdep.dylib, ...) -> ./main
#   2. codesign the executable and every Mach-O dylib in the work_dir
#   3. simctl spawn ./main, piping stdout/stderr back to the framework (compare)
#
# Invocation contract (see the framework's filter_command_line / run_script_prefix):
# the script template's own arguments come first, then the framework appends the
# quoted run command (and the "2>&1" redirect part stripped from the RUN-EXEC-PIPE):
#   $1  target runtime dir name, e.g. ios_simulator_aarch64_cjnative
#   $2  target runtime dir name again (baked template arg for consistency checks)
#   $3  %clang_opt    (cross-compile flags for clang: --target / -isysroot)
#   $4  %cangjie_runtime_link  (runtime include/lib/rpath flags)
#   $5  %clang_link_core       (-framework Foundation)
#   $6  %clang_link_objc_interop (interop libraries, variant-specific: objc.cfg vs
#       objc_static.cfg carry different values, resolved at cfg generation time)
#   $7  the expanded run command in quotes (e.g. " main")
#   The framework's end-of-case cleanup hook appends "--cleanup" after $7.
#
# Depends on the environment variable: CANGJIE_HOME

set +x

WORKSPACE=$(cd `dirname $0`; pwd)

# Source the common utility functions
source "$WORKSPACE/ios_sim_common.sh"

# The test framework re-invokes this script with "--cleanup" appended after the
# template arguments (see run_script_prefix in task.py) once a case passes. There
# is nothing to clean remotely: the executable runs in the local work_dir, which
# the framework removes itself. Detect the flag in any position and exit as a
# no-op so the framework's end-of-case hook does not error out.
for cleanup_arg in "$@"; do
    if [ "$cleanup_arg" = "--cleanup" ]; then
        exit 0
    fi
done

require_cangjie_home

TARGET="$1"
CLANG_OPT="$3"
CANGJIE_RUNTIME_LINK="$4"
CLANG_LINK_CORE="$5"
CLANG_LINK_OBJC_INTEROP="$6"
RUN_CMD="$7"

if [ -z "$TARGET" ] || [ -z "$RUN_CMD" ]; then
    echo "Error: usage: $0 <target> <target> <clang_opt> <cangjie_runtime_link> <clang_link_core> <clang_link_objc_interop> <run-cmd>" >&2
    exit 255
fi

# Extract the executable name and arguments from the run command ($7).
# Example of $7: "  main " / " main arg1 arg2" (the plain exe route's run command
# carries an "export ... && " prefix; the ObjC route leaves %run empty, so there
# is no "&&" here).
ACTUAL="${RUN_CMD##*&&}"
ACTUAL="${ACTUAL## }"
EXE="$(echo "$ACTUAL" | awk '{print $1}')"
EXE="${EXE#./}"
ARGS="$(echo "$ACTUAL" | awk '{$1=""; print $0}' | sed 's/^ *//')"

if [ -z "$EXE" ] || [ ! -f "$EXE" ]; then
    echo "Error: cannot find executable '$EXE' in $(pwd)" >&2
    exit 255
fi

# The objc-gen glue .o files are produced by the test.info line
# "cd objc-gen && %clang %clang_opt -framework Foundation *.m ... -c", which runs
# before the run stage. Collect them if present (cases without glue just link
# src/objc/*.m alone).
GLUE_OBJS=""
if [ -d objc-gen ]; then
    GLUE_OBJS=$(find objc-gen -maxdepth 1 -name "*.o" 2>/dev/null | tr '\n' ' ')
fi

echo "linking $EXE ..."
# shellcheck disable=SC2086
clang $CLANG_OPT \
    $CANGJIE_RUNTIME_LINK \
    $CLANG_LINK_CORE \
    $CLANG_LINK_OBJC_INTEROP \
    -fobjc-arc src/objc/*.m $GLUE_OBJS \
    -Isrc/objc -Iobjc-gen \
    -L. -lcjworld \
    -o "$EXE"
ret=$?
if [ $ret -ne 0 ]; then
    echo "Error: final link of $EXE failed (exit $ret)" >&2
    exit $ret
fi

# Sign the executable and the dynamic libraries in the current working directory
# (case-local glue dylibs such as libcjworld.dylib / libdep.dylib are produced in
# the work_dir by the compile stage and must be signed before spawn).
# Note: the shared runtime dylibs are signed once before running the full test
# suite (see ios_sign_runtime.sh), avoiding races from concurrent codesign.
sign_executable "$EXE"
sign_dylibs_in_dir "$(pwd)"

# Find the simulator
UDID="$(get_simulator_udid)"

# Run
run_on_simulator "$UDID" "$EXE" $ARGS
