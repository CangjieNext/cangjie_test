#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#

set +x
set -e

WORKSPACE=$(cd `dirname $0`; pwd)

source "$WORKSPACE/ios_sim_common.sh"

require_cangjie_home || exit 255


RUN_CMD="$1"

ACTUAL="${RUN_CMD##*&&}"
ACTUAL="${ACTUAL## }"
EXE="$(echo "$ACTUAL" | awk '{print $1}')"
EXE="${EXE#./}"
ARGS="$(echo "$ACTUAL" | awk '{$1=""; print $0}' | sed 's/^ *//')"

if [ -z "$EXE" ] || [ ! -f "$EXE" ]; then
    echo "Error: cannot find executable '$EXE' in $(pwd)"
    exit 255
fi


sign_executable "$EXE"


sign_runtime_dylibs "$(ios_runtime_lib_dir)"


sign_dylibs_in_dir "$(pwd)"


UDID="$(get_simulator_udid)" || exit 255


run_on_simulator "$UDID" "$EXE" $ARGS
ret=$?

exit $ret