// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify the final branch of a complex or-pattern keeps the enclosing if/while source.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_block_in_expression"
// ASSERT: scan-2 "DiagKind": "chir_unreachable_pattern"

main() {
    let ifValue = (3, 6)
    if (let (1, 2) | (3, 4) <- ifValue) {
        println("unreachable if-let body")
    }

    let whileValue = (3, 6)
    while (let (1, 2) | (3, 4) <- whileValue) {
        println("unreachable while-let body")
        break
    }
}
