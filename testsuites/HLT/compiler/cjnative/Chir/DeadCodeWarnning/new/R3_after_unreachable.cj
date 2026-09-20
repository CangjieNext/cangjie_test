// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [R3_after_unreachable] 不可达分支后的可达代码继续分析
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.3 R3（不可达分支诊断范围保持分支内; 最后 then 独立 1 条; 2026-09-20 新 SDK 实测 1 条与本断言一致，升 A；R3 族过度推断仅限 const+guard 交互（见 C16 留证））
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    var flag = true
    if (flag) {
        println("first")
    }

    flag = false
    if (!flag) {
        println("reachable continuation")
    }

    if (false) {
        println("dead suffix branch")
    }
}
