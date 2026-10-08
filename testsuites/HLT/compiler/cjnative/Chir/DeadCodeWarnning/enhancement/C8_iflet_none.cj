// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C8_iflet_none] 已知 None 使 if-let/while-let 确定失败
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C8（if body/while body 各 1 条 block）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    let first = Option<Int64>.None
    if (let Some(value) <- first) {
        println(value)
    }

    let second = Option<Int64>.None
    while (let Some(value) <- second) {
        println(value)
    }
}
