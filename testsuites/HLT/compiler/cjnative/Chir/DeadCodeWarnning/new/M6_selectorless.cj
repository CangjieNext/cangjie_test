// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [M6_selectorless] 无选择器 match
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.4 M6（_ 覆盖后续条件; true/false 各 1 条; 2026-09-20 新 SDK 实测 2 条 sema 与本断言一致，升 A）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "sema_unreachable_pattern"

main() {
    match {
        case _ => println("first")
        case true => println("covered true")
        case false => println("covered false")
    }
}
