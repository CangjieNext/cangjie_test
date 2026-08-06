// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Immutable local arithmetic, logical, and range facts reach branch analysis.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-8 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    let first = 2
    let shifted = first + 3
    if (shifted < 0) {
        println("unreachable let arithmetic")
    }

    let left = 3
    let right = 4
    let total = left + right
    if (total == 7) {
        println("reachable let sum")
    } else {
        println("unreachable let sum else")
    }

    let truth = true
    if (!truth) {
        println("unreachable logical not")
    }

    let oneFalse = false
    if (truth && oneFalse) {
        println("unreachable logical and")
    }

    if (oneFalse || oneFalse) {
        println("unreachable logical or")
    }

    let zero = 0
    if (zero != 0) {
        println("unreachable inequality")
    }

    let limit = 10
    if (limit > 100) {
        println("unreachable let comparison")
    }

    if (limit > 0) {
        if (limit < 0) {
            println("unreachable range contradiction")
        }
    }
}
