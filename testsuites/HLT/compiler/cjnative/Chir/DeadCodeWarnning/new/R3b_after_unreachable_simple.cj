// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [R3b_after_unreachable_simple] 不可达分支后的可达代码继续分析（简化形态）
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.3 R3 正面价值承载（不可达分支后可达代码仍继续分析; 独立 1 条; 本 SDK 实测一致）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    let live = 1
    if (live > 0) {
        println("reachable continuation")
    }

    if (false) {
        println("dead suffix branch")
    }

    println("analysis continues here")
}
