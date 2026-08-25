#!/usr/bin/env bash
# TC-GENINST-CROSS-PACKAGE | 跨包扩展/缓存隔离最小工程
# 需求 design-spec §3(包可见性/orphan 规则)/§6 可靠性(跨包不串)。
# 用 cjpm 构建多包工程:pkg_a 导出 I+A(static 库),根包 import pkg_a 并实例化触发跨包按需查询。
# 断言运行输出 TRACE_OK(跨包查询命中 pkg_a.A.foo,无陈旧复用/串包)。
#
# 用法:
#   cd testcases/external/TC-GENINST-CROSS-PACKAGE
#   cjpm build   # 构建根包(executable)+ pkg_a(static)
#   cjpm run     # 运行根包 src/main.cj 入口,断言 TRACE_OK
#
# 本目录是独立的最小 cjpm 多包工程骨架。
# 缓存生命周期 miss/hit/ClearCache 的白盒观察不在本 fixture 范围,
# 本 fixture 验证的是跨包按需查询命中的可观察结果正确。
set -u
cd "$(dirname "$0")"
echo "== build =="
cjpm build || { echo "FAIL build"; exit 1; }
echo "== run =="
out=$(cjpm run 2>&1)
echo "$out"
if echo "$out" | grep -q "TRACE_OK"; then
  echo "PASS cross-package TRACE_OK"
  exit 0
else
  echo "FAIL cross-package (no TRACE_OK)"
  exit 1
fi
