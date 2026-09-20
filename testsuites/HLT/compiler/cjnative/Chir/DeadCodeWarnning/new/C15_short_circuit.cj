// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C15_short_circuit] 短路右操作数三形态
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C15（&&/||/?? 三个被跳过右操作数各 1 条 unreachable expression）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-3 "DiagKind": "chir_dce_unreachable_expression"

func sideEffect(): Bool { true }

main() {
    let first = false &&
        sideEffect()
    let second = true ||
        sideEffect()
    let third = Option<Bool>.Some(true) ??
        sideEffect()
    println(first)
    println(second)
    println(third)
}
