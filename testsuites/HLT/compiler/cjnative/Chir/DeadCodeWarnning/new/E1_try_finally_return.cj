// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E1_try_finally_return] try/finally 全转移
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.5 E1.7（finally 末尾时进入 finally 前的 return 继续返回; 2026-09-20 新 SDK 实测 1 条与本断言一致，升 A; 官方 try_completion.cj 同口径）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

func value(): Int64 {
    try {
        return 1
    } finally {
        println("cleanup")
    }
    println("dead after try-finally")
    2
}

main() {
    println(value())
}
