// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [M3_duplicate_literals] Rune/Float 重复字面量
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.4 M3（Rune、Float、Unit 重复字面量适用 M2 重复 pattern 规则）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "sema_unreachable_pattern"

func classifyF(v: Float64): Int64 {
    match (v) {
        case 1.0 => 0
        case 1.0 => 1
        case _ => 2
    }
}

func classifyR(v: Rune): Int64 {
    match (v) {
        case r'a' => 0
        case r'a' => 1
        case _ => 2
    }
}

main() {
    println(classifyF(1.0))
    println(classifyR(r'a'))
}
