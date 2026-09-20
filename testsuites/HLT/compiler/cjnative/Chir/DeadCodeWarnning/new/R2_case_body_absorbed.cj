// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [R2_case_body_absorbed] 不可达 case body 不递归二级诊断
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.3 R2（case 1 条 pattern; body 归入诊断范围, 额外 0 warning; sibling 继续分析）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

main() {
    match (1) {
        case _ => println("first")
        case 1 =>
            if (false) {
                println("covered by case warning")
            }
    }
}
