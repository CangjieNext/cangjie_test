#!/usr/bin/env bash
# TC-GENINST-PROPERTY-MATRIX | 成员属性来源×覆盖方向决策矩阵 27 条逐项最小 fixture
# 与成员函数关系矩阵(relation_matrix 26 条)同等程度覆盖:成员来源×覆盖方向逐维独立。
# 正向 fixture(24):01-22,24,25 采用仓颉单元测试框架(@Test/@TestCase/@Expect),
#   cjc --test -O0/-O2 编译链接运行,断言输出含 PASSED:1 且 FAILED:0。
# 负向 fixture(3):23/26/27 编译断言失败 + --diagnostic-format json 符号化 DiagKind 匹配。
#   负向不进 unittest(需编译通过才能跑 @Test),保留 main 占位 + EXEC-PIPE-1 头部。
# 注:维度 23(菱形同向合并)函数版编译通过(合并去重),但 cjc 1.3.0 实测属性版编译失败,
#     按既有矩阵以实测行为为准落为负向(sema_interface_member_must_be_implemented)。
set -u
CJC="${1:-cjc}"
ROOT="$(cd "$(dirname "$0")" && pwd)"
FAIL=0
# 去除 ANSI 终端控制序列的函数(便于 grep 单元测试结果)
strip_ansi() { sed -r 's/\x1B(\][^\x07]*\x07|[[0-9;?]*[a-zA-Z]|[78])//g' | tr -d '\r'; }

# 24 个正向 fixture(01-22 + 24 + 25)
POSITIVE=(01_interface_abstract_to_class 02_interface_default_to_class 03_abstract_interface_to_abstract_class 04_inherited_impl_to_subclass 05_abstract_parent_to_concrete_subclass 06_interface_abstract_to_extend 07_interface_default_to_extend 08_parent_interface_abstract_to_child_interface 09_parent_interface_default_to_child_interface 10_parent_class_to_child_class 11_parent_class_to_interface 12_class_to_interface 13_class_to_extend_interface 14_extend_interface_default_to_type 15_extend_member_to_type 16_extend_member_to_interface 17_type_member_overrides_parent_interface 18_type_member_overrides_parent_class 19_class_overrides_interface_default 20_extend_overrides_interface_default 21_multiple_default_derived_select 22_default_plus_abstract_unique_select 24_cross_direction_prefer_type 25_getter_setter_independent)

for n in "${POSITIVE[@]}"; do
  d="$ROOT/$n"
  [ -d "$d" ] || { echo "MISS $n"; FAIL=1; continue; }
  ok=1
  for opt in -O0 -O2; do
    out="$d/prog_${opt//-/}"
    if "$CJC" "$d/main.cj" --test $opt -o "$out" >"$d/build_${opt//-/}.log" 2>&1; then
      actual=$("$out" 2>"$d/runerr_${opt//-/}.err" | strip_ansi)
      if echo "$actual" | grep -q "PASSED: 1" && echo "$actual" | grep -q "FAILED: 0"; then
        :
      else
        echo "FAIL $n $opt (got: $(echo "$actual" | tr '\n' ' ' | cut -c1-120))"; FAIL=1; ok=0
      fi
      rm -f "$out"
    else
      echo "FAIL $n $opt build"; FAIL=1; ok=0
    fi
  done
  [ $ok -eq 1 ] && echo "PASS $n (-O0/-O2 unittest PASSED:1 FAILED:0)"
done

# 3 个负向 fixture(23/26/27)
declare -A EXPECTED=(
  [23_same_direction_merge_dedup]="sema_interface_member_must_be_implemented"
  [26_direct_unrelated_defaults]="sema_interface_member_must_be_implemented"
  [27_diamond_default_conflict]="sema_interface_member_must_be_implemented"
)

for n in 23_same_direction_merge_dedup 26_direct_unrelated_defaults 27_diamond_default_conflict; do
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
