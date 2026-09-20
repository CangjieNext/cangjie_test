// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [M4_tuple_exhaustive] 元组组合穷举
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.4 M4（适用于未知 selector——来源是 pattern 结构完整覆盖）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

func classify(pair: (Bool, Bool)): Int64 {
    match (pair) {
        case (true, true) => 0
        case (true, false) => 1
        case (false, true) => 2
        case (false, false) => 3
        case _ => 4
    }
}

main() {
    println(classify((true, false)))
}
