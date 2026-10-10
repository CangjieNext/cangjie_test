// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C17_let_scalar] 局部 let 确定标量
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C17
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    let first = 2
    let result = first + 3
    if (result < 0) {
        println("dead arithmetic branch")
    }

    let truth = false
    if (truth) {
        println("dead Bool branch")
    }
}
