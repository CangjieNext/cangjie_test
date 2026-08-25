#!/usr/bin/env bash
# 六步②③④⑤⑥ 泛型函数触发正向用例 (-O0/-O2 双跑,断言 TRACE_OK)
# 覆盖 design-spec §3 第②~⑥步在泛型函数 k<T>(a:T) where T<:I1 触发形态下的按需查询真路径。
set -u
CJC="${1:-cjc}"
ROOT="$(cd "$(dirname "$0")" && pwd)"
FAIL=0

CASES=(DFX_case2_g DFX_case3_g DFX_case4_g DFX_case5_g DFX_case6_g)

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
      # 烟雾: -O2 不得出现 undefined symbol
      if [ "$opt" = "-O2" ] && grep -qi "undefined symbol" "$d/build_$opt.log" "$d/run_$opt.out"; then
        echo "FAIL $n $opt undefined symbol"; ok=0
      fi
    fi
    rm -f "$out"
  done
  [ $ok -eq 1 ] && echo "PASS $n (-O0/-O2 TRACE_OK)"
  [ $ok -eq 0 ] && FAIL=1
done
exit $FAIL
