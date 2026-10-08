// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S6_operator_lhs_rhs] operator 左/右操作数自身 Nothing
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.1 S6（右操作数自身 Nothing 且不含内部调用 → 1 条 unreachable 'operator'，主范围=operator token 到右操作数末尾; 2026-09-20 按 Tier 转移规则升 A: 本 SDK 实测 scan-1 精确一致）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable"

func left(): Int64 { 1 }

main() {
    var value = left() + return 9999
    0
}
