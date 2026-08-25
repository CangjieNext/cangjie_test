#!/usr/bin/env bash
# TC-GENINST-SEED + TC-GENINST-PARITY: 六步种子 O0/O2 双跑,断言 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
# 用法: bash run_all.sh [CJC] [CJPM_ROOT]
# 直接用 cjc 编译各目录 main.cj。
set -u
CJC="${1:-cjc}"
ROOT="$(cd "$(dirname "$0")" && pwd)"
FAIL=0
SEEDS=(DFX_case1 DFX_case1g DFX_case2 DFX_case3 DFX_case4 DFX_case5 DFX_case6 DFX_case8 GENINST_issue843)

for s in "${SEEDS[@]}"; do
  d="$ROOT/$s"
  [ -d "$d" ] || { echo "MISS $s"; FAIL=1; continue; }
  for opt in -O0 -O2; do
    out="$d/prog_${s}_${opt//-/}"
    if "$CJC" "$d/main.cj" $opt -o "$out" >"$d/build_${opt//-/}.log" 2>&1; then
      actual=$("$out" 2>"$d/run_${opt//-/}.err")
      if [ "$actual" = "TRACE_OK" ]; then
        echo "PASS $s $opt"
      else
        echo "FAIL $s $opt (got: $actual)"; FAIL=1
      fi
      if grep -qi "undefined symbol\|MISMATCH" "$d/run_${opt//-/}.err" 2>/dev/null; then
        echo "FAIL $s $opt stderr has undefined symbol/MISMATCH"; FAIL=1
      fi
      rm -f "$out"
    else
      echo "FAIL $s $opt build"; FAIL=1
    fi
  done
done

# issue843 专项烟雾:stderr 不含 undefined symbol
if grep -qi "undefined symbol" "$ROOT/GENINST_issue843/run_o2.err" 2>/dev/null; then
  echo "FAIL GENINST_issue843 -O2 has undefined symbol"; FAIL=1
fi

exit $FAIL
