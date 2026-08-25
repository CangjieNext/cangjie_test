#!/usr/bin/env bash
# 跳过策略 4 条分支正向用例 (-O0/-O2 双跑,断言 TRACE_OK)
# 覆盖 design-spec §3 跳过策略 ShouldSkipAbstractFuncResolution 四条:
#   SKIP1 非成员/非虚成员  SKIP2 接口非静态成员 vs static
#   SKIP3 Class 本类方法   SKIP4 baseTy 同类型覆盖
set -u
CJC="${1:-cjc}"
ROOT="$(cd "$(dirname "$0")" && pwd)"
FAIL=0

CASES=(SKIP1_nonmember SKIP2_interface_nonstatic SKIP3_class_self SKIP4_basety_sametype)

for n in "${CASES[@]}"; do
  d="$ROOT/$n"
  [ -d "$d" ] || { echo "MISS $n"; FAIL=1; continue; }
  ok=1
  for opt in -O0 -O2; do
    out="$d/prog_${opt//-/}"
    "$CJC" "$d/main.cj" $opt -o "$out" >"$d/build_$opt.log" 2>&1
    rc=$?
    if [ $rc -ne 0 ]; then
      echo "FAIL $n $opt compile (rc=$rc)"; sed 's/^/  /' "$d/build_$opt.log" | head -6; ok=0
    else
      "$out" > "$d/run_$opt.out" 2>&1
      if grep -q "TRACE_OK" "$d/run_$opt.out"; then
        :
      else
        echo "FAIL $n $opt run (no TRACE_OK)"; sed 's/^/  /' "$d/run_$opt.out" | head -6; ok=0
      fi
    fi
    rm -f "$out"
  done
  [ $ok -eq 1 ] && echo "PASS $n (-O0/-O2 TRACE_OK)"
  [ $ok -eq 0 ] && FAIL=1
done
exit $FAIL
