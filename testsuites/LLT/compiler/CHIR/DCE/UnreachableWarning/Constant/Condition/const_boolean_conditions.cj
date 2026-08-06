// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify constant Boolean and comparison expressions propagate into conditions.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f


// ASSERT: scan-5 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    const andResult = true && false
    if (andResult) { println("unreachable const and") }

    const orResult = false || false
    if (orResult) { println("unreachable const or") }

    const notResult = !true
    if (notResult) { println("unreachable const not") }

    const equal = 2 == 2
    if (!equal) { println("unreachable const equality") }

    const ordered = 1 < 2
    if (!ordered) { println("unreachable const ordering") }
}
