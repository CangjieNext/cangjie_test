// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A false guard must not hide later reachable and unreachable match cases,
// and a reachable guard fact must reach its case body.

// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"
// ASSERT: scan-4 "DiagKind": "chir_unreachable_pattern"

main() {
    let grade = 85
    let label = match (grade) {
        case g where g >= 90 => "A"
        case g where g >= 80 => "B"
        case g where g >= 70 => "C"
        case _ => "D"
    }
    println(label)

    let value = 1
    match (value) {
        case number where number > 0 =>
            if (number < 0) {
                println("unreachable case guard body")
            }
        case _ => println("fallback")
    }
}
