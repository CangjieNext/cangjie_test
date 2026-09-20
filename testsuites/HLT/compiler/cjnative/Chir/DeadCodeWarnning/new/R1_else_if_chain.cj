// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [R1_else_if_chain] else-if 链独立诊断根
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.3 R1（else 路径继续分派; 两个标记各 1 条）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    if (false) {
        println("dead first then")
    } else if (true) {
        println("live middle then")
    } else {
        println("dead final else")
    }
}
