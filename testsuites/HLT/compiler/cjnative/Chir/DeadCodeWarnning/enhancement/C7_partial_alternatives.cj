// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C7_partial_alternatives] 部分 alternative 被排除时分别报告
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C7/§R2（case 保留可匹配 alternative Green，仅重复 Red 各报 1 条）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

enum Colour {
    | Red
    | Green
    | Blue
}

func classify(colour: Colour): Int64 {
    match (colour) {
        case Red => 0
        case Red | Green => 1
        case Blue => 2
    }
}

main() {
    println(classify(Colour.Green))
}
