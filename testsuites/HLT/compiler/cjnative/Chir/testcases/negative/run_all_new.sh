#!/usr/bin/env bash
# 新增 5 个负向用例: 断言 cjc 编译失败 + DiagKind 匹配(用 --diagnostic-format json 拿到符号化 DiagKind)。
# 注: 负向用例预期编译失败,不得作为 runtime trace 用例。
# DiagKind 经 cjc 1.3.0-alpha.02 实测确认(不盲信 SPEC 文本)。
set -u
CJC="${1:-cjc}"
ROOT="$(cd "$(dirname "$0")" && pwd)"
FAIL=0

# 部分用例 cjc 先发一条伴随诊断(如 sema_ambiguous_match/sema_unexpected_return_type_for_entry),
# 表中给出该用例的"权威" DiagKind(命中其一即 PASS),取真正反映该负向约束的那条。
declare -A EXPECTED=(
  [NEG_covariant_return_incompatible]="sema_return_type_incompatible"
  [NEG_extend_forbidden_override]="parse_illegal_modifier_in_scope"
  [NEG_extend_shadow_member]="sema_extend_member_cannot_shadow"
  [NEG_extend_duplicate_interface]="sema_extend_duplicate_interface"
  [NEG_subinterface_redeclare_no_impl]="sema_invalid_override_or_redefine_member_in_interface"
)

for n in NEG_covariant_return_incompatible NEG_extend_forbidden_override NEG_extend_shadow_member NEG_extend_duplicate_interface NEG_subinterface_redeclare_no_impl; do
  d="$ROOT/$n"
  [ -d "$d" ] || { echo "MISS $n"; FAIL=1; continue; }
  # 用 JSON 诊断拿到符号化 DiagKind
  "$CJC" "$d/main.cj" --diagnostic-format json -o "$d/prog_neg" >"$d/build.json" 2>&1
  rc=$?
  if [ $rc -eq 0 ]; then
    echo "FAIL $n compiled (should have failed)"; FAIL=1
  else
    diag="${EXPECTED[$n]}"
    # 兼容 "DiagKind": "x" 与 "DiagKind":"x" 两种 JSON 空格形态
    if grep -qE "\"DiagKind\": *\"$diag\"" "$d/build.json" 2>/dev/null; then
      echo "PASS $n ($diag)"
    else
      echo "FAIL $n DiagKind mismatch (expected $diag)"; sed 's/^/  /' "$d/build.json" | head -8; FAIL=1
    fi
  fi
  rm -f "$d/prog_neg"
done
exit $FAIL
