#!/usr/bin/env bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# case25_http_complex_json_stream 一键执行 + 达标判定。
#
# 用法：
#   cd <case25_http_complex_json_stream 目录>
#   CANGJIE_OPT_ROOT=<cangjie-opt SDK 根> bash run_and_check.sh
#
# 流程：
#   1) 运行 run_compare.sh，生成 <timestamp>_opt_gc1_vs_gc2_* 对比目录与 compare_report.md；
#   2) 调用 script/check_case25_pass.py 判定：
#        以 WGC(cjEnableGC=1) 为基线，要求 GenerationalGC(cjEnableGC=2)
#        每成功请求 CPU 成本下降 >= 30% 且平均 RSS 下降 >= 30%；
#   3) 达标退出 0，否则退出非零（FAIL）。
set -euo pipefail

CASE_DIR="$(cd "$(dirname "$0")" && pwd -P)"
SCRIPT_DIR="$CASE_DIR/script"
PYTHON_BIN="${PYTHON_BIN:-python3}"

echo "[INFO] ==== case25_http_complex_json_stream: run + check ===="
run_output="$(bash "$CASE_DIR/run_compare.sh" "$@")"
printf '%s\n' "$run_output"

compare_dir="$(printf '%s\n' "$run_output" | sed -n 's/^\[DONE\] compare_dir=//p' | tail -n 1)"
if [[ -z "$compare_dir" || ! -d "$compare_dir" ]]; then
    echo "[ERROR] 未能从 run_compare.sh 输出中定位 compare_dir" >&2
    exit 1
fi
echo "[INFO] compare_dir=$compare_dir"
echo "[INFO] compare_report: $compare_dir/compare_report.md"

"$PYTHON_BIN" "$SCRIPT_DIR/check_case25_pass.py" \
    --compare-dir "$compare_dir" \
    --report "$compare_dir/compare_report.md"
