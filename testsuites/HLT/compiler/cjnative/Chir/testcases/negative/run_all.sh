#!/usr/bin/env bash
# TC-GENINST-NEG_*: 7 个负向用例,断言 cjc 编译失败 + DiagKind 匹配(用 --diagnostic-format json 拿到符号化 DiagKind)。
# 注: 负向用例预期编译失败,不得作为 runtime trace 用例。
set -u
CJC="${1:-cjc}"
ROOT="$(cd "$(dirname "$0")" && pwd)"
FAIL=0

declare -A EXPECTED=(
  [NEG_abstract_unimpl]="sema_class_need_abstract_modifier_or_func_need_impl"
  [NEG_sig_conflict]="sema_return_type_incompatible"
  [NEG_generic_constraint]="sema_generic_type_argument_not_match_constraint"
  [NEG_diamond_default_conflict]="sema_interface_member_must_be_implemented"
  [NEG_unrelated_extend_conflict]="sema_extend_member_cannot_shadow"
  [NEG_static_instance_clash]="sema_static_and_non_static_member_cannot_have_same_name"
  [NEG_generic_mismatch]="sema_return_type_incompatible"
)

for n in NEG_abstract_unimpl NEG_sig_conflict NEG_generic_constraint NEG_diamond_default_conflict NEG_unrelated_extend_conflict NEG_static_instance_clash NEG_generic_mismatch; do
  d="$ROOT/$n"
  [ -d "$d" ] || { echo "MISS $n"; FAIL=1; continue; }
  # 用 JSON 诊断拿到符号化 DiagKind
  "$CJC" "$d/main.cj" --diagnostic-format json -o "$d/prog_neg" >"$d/build.json" 2>&1
  rc=$?
  if [ $rc -eq 0 ]; then
    echo "FAIL $n compiled (should have failed)"; FAIL=1
  else
    diag="${EXPECTED[$n]}"
    if grep -q "\"DiagKind\": \"$diag\"" "$d/build.json" 2>/dev/null || grep -q "\"DiagKind\":\"$diag\"" "$d/build.json" 2>/dev/null; then
      echo "PASS $n ($diag)"
    else
      echo "FAIL $n DiagKind mismatch (expected $diag)"; sed 's/^/  /' "$d/build.json" | head -8; FAIL=1
    fi
  fi
  rm -f "$d/prog_neg"
done
exit $FAIL
