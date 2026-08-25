#!/usr/bin/env bash
# TC-GENINST-RELATION-MATRIX | 成员来源×覆盖方向决策矩阵 26 条逐项最小 fixture
# 合法 fixture：-O0/-O2 双跑断言 TRACE_OK，stderr 无 MISMATCH/undefined symbol。
# 负向 fixture（23/25/26）：cjc 编译断言失败 + --diagnostic-format json 符号化 DiagKind 匹配。
#   23(菱形同向合并):cjc 1.3.0 实测两路径到达同一接口默认仍要求显式实现,编译失败。
# 直接用 cjc 编译各目录 main.cj。
set -u
CJC="${1:-cjc}"
ROOT="$(cd "$(dirname "$0")" && pwd)"
FAIL=0

# 23 个合法 fixture（01-22, 24）
POSITIVE=(01_interface_abstract_to_class 02_interface_default_to_class 03_abstract_interface_to_abstract_class 04_inherited_impl_to_subclass 05_abstract_parent_to_concrete_subclass 06_interface_abstract_to_extend 07_interface_default_to_extend 08_parent_interface_abstract_to_child_interface 09_parent_interface_default_to_child_interface 10_parent_class_to_child_class 11_parent_class_to_interface 12_class_to_interface 13_class_to_extend_interface 14_extend_interface_default_to_type 15_extend_member_to_type 16_extend_member_to_interface 17_type_member_overrides_parent_interface 18_type_member_overrides_parent_class 19_class_overrides_interface_default 20_extend_overrides_interface_default 21_multiple_default_derived_select 22_default_plus_abstract_unique_select 24_cross_direction_prefer_type)

for n in "${POSITIVE[@]}"; do
  d="$ROOT/$n"
  [ -d "$d" ] || { echo "MISS $n"; FAIL=1; continue; }
  ok=1
  for opt in -O0 -O2; do
    out="$d/prog_${opt//-/}"
    if "$CJC" "$d/main.cj" $opt -o "$out" >"$d/build_${opt//-/}.log" 2>&1; then
      actual=$("$out" 2>"$d/run_${opt//-/}.err")
      if [ "$actual" = "TRACE_OK" ]; then
        :
      else
        echo "FAIL $n $opt (got: $actual)"; FAIL=1; ok=0
      fi
      if grep -qi "undefined symbol\|MISMATCH" "$d/run_${opt//-/}.err" 2>/dev/null; then
        echo "FAIL $n $opt stderr has undefined symbol/MISMATCH"; FAIL=1; ok=0
      fi
      rm -f "$out"
    else
      echo "FAIL $n $opt build"; FAIL=1; ok=0
    fi
  done
  [ $ok -eq 1 ] && echo "PASS $n (-O0/-O2 TRACE_OK)"
done

# 3 个负向 fixture（23/25/26）
declare -A EXPECTED=(
  [23_same_direction_merge_dedup]="sema_interface_member_must_be_implemented"
  [25_getter_setter_independent]="sema_property_must_have_accessors"
  [26_direct_unrelated_defaults]="sema_interface_member_must_be_implemented"
)

for n in 23_same_direction_merge_dedup 25_getter_setter_independent 26_direct_unrelated_defaults; do
  d="$ROOT/$n"
  [ -d "$d" ] || { echo "MISS $n"; FAIL=1; continue; }
  "$CJC" "$d/main.cj" --diagnostic-format json -o "$d/prog_neg" >"$d/build.json" 2>&1
  rc=$?
  if [ $rc -eq 0 ]; then
    echo "FAIL $n compiled (should have failed)"; FAIL=1
  else
    diag="${EXPECTED[$n]}"
    if grep -qE "\"DiagKind\": *\"$diag\"" "$d/build.json" 2>/dev/null; then
      echo "PASS $n ($diag)"
    else
      echo "FAIL $n DiagKind mismatch (expected $diag)"; sed 's/^/  /' "$d/build.json" | head -8; FAIL=1
    fi
  fi
  rm -f "$d/prog_neg"
done

exit $FAIL
