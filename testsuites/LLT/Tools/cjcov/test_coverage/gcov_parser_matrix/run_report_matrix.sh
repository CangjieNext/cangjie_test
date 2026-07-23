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

run_cjcov source_fallback \
    --root=. \
    --source=source_root \
    --output=output_source_fallback \
    --html-details \
    --branches \
    --keep

# Keep a licensed source fixture in the repository, but make the execution
# copy a single line without a trailing newline to exercise that read path.
printf '%s' 'package empty' > src/empty.cj
run_cjcov empty \
    --root=. \
    --output=output_empty \
    --html-details \
    --branches \
    --xml \
    --json \
    --keep

mkdir -p output_json_failure/coverage.json
run_cjcov valid \
    --root=. \
    --output=output_json_failure \
    --json \
    --keep

run_cjcov merge \
    --root=. \
    --output=output_merge \
    --html-details \
    --branches \
    --verbose \
    --xml \
    --json \
    --keep

run_cjcov valid --exclude=same --include=same || true

mkdir -p output_regex/cjcov_logs
touch output_regex/cjcov_logs/stale.log
run_cjcov valid \
    --root=. \
    --include="${case_root}/*src/main.cj" \
    --output="${case_root}/output_regex" \
    --keep

run_cjcov valid \
    --root=. \
    --output="${case_root}/output_absolute" \
    --keep

test -f output_empty/index.html
test -f output_empty/src_empty.cj.html
test -f output_empty/coverage.xml
test -f output_empty/coverage.json
test -f output_merge/index.html
test -f output_merge/src_main.cj.html
test -f output_merge/cjcov_logs/gcov_parse.log
test -f output_json_failure/index.html
test ! -e output_regex/cjcov_logs/stale.log
