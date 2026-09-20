// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C10_whilelet_or_pattern] while-let 同构 or-pattern
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C10.3（while-let 同构; 2026-09-20 新 SDK 与官方 complex_or_condition_source while 行一致: 1 pattern+1 block）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_unreachable_pattern"
// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    let value = (3, 6)
    while (let (1, 2) | (3, 4) <- value) {
        println("x")
    }
}
