// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S6_decl_init] declaration initializer 双诊断根共存
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.1 S6（声明根与最内层后缀根; 2026-09-20 新 SDK 实测 hint@C5+call@C17+hint@C33 双 hint 形态, 升 A）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"
// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable"

func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }
func combine(first: Int64, second: Int64): Int64 { first + second }

main() {
    var value = combine(stop(), next())
    0
}
