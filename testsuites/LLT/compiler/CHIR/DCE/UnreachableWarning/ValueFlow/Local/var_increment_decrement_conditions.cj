// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify value tracking across increment and decrement expressions.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f


// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    var incremented = 0
    incremented++
    if (incremented == 0) { println("unreachable increment") }

    var decremented = 1
    decremented--
    if (decremented != 0) { println("unreachable decrement") }
}
