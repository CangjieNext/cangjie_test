// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S3_continue_break_regions] break/continue 后独立顺序区域
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.1 S3（两个独立顺序区域各 1 条; 2026-09-20 新 SDK 实测 2 条与本断言一致，升 A）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"

main() {
    for (index in 0..2) {
        if (index == 0) {
            continue
            println("dead after continue")
        }
        break
        println("dead after break")
    }
}
