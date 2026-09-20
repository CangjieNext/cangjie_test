// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C8_payload_pattern] while-let payload pattern 确定失配主范围为 pattern
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C8（block warning 主范围=Active(1, 2)，body 归入诊断范围; 本 SDK 实测 block@pattern 行）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"

enum State {
    | Active(Int64, Int64)
    | Stopped
}

main() {
    const state = State.Stopped
    while (let Active(1, 2) <- state) {
        println("dead payload-pattern body")
    }
}
