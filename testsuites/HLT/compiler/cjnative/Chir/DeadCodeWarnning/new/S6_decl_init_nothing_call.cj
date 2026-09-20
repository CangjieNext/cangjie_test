// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S6_decl_init_nothing_call] 外层调用结果 Nothing 时双根仍保留
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.1 S6（外层 halt 返回 Nothing: 声明根与后缀根同时保留; 2026-09-20 新 SDK 实测 hint2+call1, 升 A）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"
// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable"

func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }
func halt(first: Int64, second: Int64): Nothing { throw Exception() }

main() {
    var value = halt(stop(), next())
    0
}
