// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E1_continue_finally] 循环内 try{continue}finally
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.5 E1（continue 在 finally 执行到末尾后继续生效 → 1 条; break 同构; 2026-09-20 新 SDK 实测一致，升 A）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

func continueCase(flag: Bool) {
    while (flag) {
        try {
            continue
        } finally {
            println("cleanup")
        }
        println("dead after continue")
    }
}

main() {
    continueCase(true)
}
