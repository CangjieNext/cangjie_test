#!/bin/sh
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

case_root=$(pwd)
fake_home="${case_root}/fake_home"
fake_path="${case_root}/bin:${PATH}"
cjcov_bin=$(command -v cjcov)

mkdir -p "${fake_home}"
touch input.gcno

run_cjcov() {
    scenario=$1
    shift
    rm -f ./*.gcov
    CANGJIE_HOME="${fake_home}" \
        PATH="${fake_path}" \
        CJCOV_FAKE_SCENARIO="${scenario}" \
        "${cjcov_bin}" "$@"
}

for scenario in fail no_gcov invalid_head invalid_body bad_lineno bad_hit missing_source directory_source; do
    run_cjcov "${scenario}" \
        --root=. \
        --output="output_${scenario}" \
        --html-details \
        --branches \
        --keep || true
done

CANGJIE_HOME="${fake_home}" PATH=/usr/bin:/bin "${cjcov_bin}" --root=. || true

test -f output_missing_source/cjcov_logs/reason_for_no_valid_source
cat output_missing_source/cjcov_logs/cjcov.log
