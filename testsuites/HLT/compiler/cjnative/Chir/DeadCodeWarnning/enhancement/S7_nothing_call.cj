// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S7_nothing_call] 返回 Nothing 的函数调用后继
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.1 S7（全实参已求值且调用自身 Nothing → 后继 1 条; S6 已建立根时 S7 不重复; 2026-09-20 新 SDK 实测 1 条，升 A）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

func stop(): Nothing {
    throw Exception()
}

main() {
    stop()
    println("dead after Nothing call")
    0
}
