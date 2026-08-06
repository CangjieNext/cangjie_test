// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Direct, named, and scalar const values select the corresponding if branch.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-7 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    if (true) {
        println("reachable true branch")
    } else {
        println("unreachable true else")
    }

    if (false) {
        println("unreachable false then")
    } else {
        println("reachable false branch")
    }

    const enabled = true
    if (enabled) {
        println("reachable const branch")
    } else {
        println("unreachable const else")
    }

    const threshold = 10
    if (threshold > 100) {
        println("unreachable const comparison")
    }

    const negative = -1
    if (negative >= 0) { println("unreachable const unary negative") }

    const letter = r'a'
    if (letter != r'a') { println("unreachable const rune") }

    const ratio: Float64 = 1.0
    if (ratio > 2.0) { println("unreachable const float") }
}
