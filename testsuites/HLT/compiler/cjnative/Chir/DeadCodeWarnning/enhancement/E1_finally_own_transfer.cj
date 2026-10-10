// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E1_finally_own_transfer] finally 自带 return/throw 覆盖原转移
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.5 E1.6（finally 自带转移取代原转移 → 后继 hint; 2026-09-20 新 SDK 实测 2 条——finally return/throw 后各 1 条连续区域合并, 与官方 try_completion.cj SCAN-IN 3 块结构一致(after all-return/after finally return/after finally throw 各 1), 升 A）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"

func finallyReturn(): Int64 {
    try {
        println("try body")
    } finally {
        return 1
    }
    println("unreachable after finally return")
    return 2
}

func finallyThrow() {
    try {
        println("try body")
    } finally {
        throw Exception()
    }
    println("unreachable after finally throw")
    println("also unreachable after finally throw")
}

func catchCompletesNormally() {
    try {
        throw Exception()
    } catch (_: Exception) {
        println("handled")
    } finally {
        println("cleanup")
    }
    println("reachable after try-catch-finally")
}

main() {
    println(finallyReturn())
    finallyThrow()
    catchCompletesNormally()
}
