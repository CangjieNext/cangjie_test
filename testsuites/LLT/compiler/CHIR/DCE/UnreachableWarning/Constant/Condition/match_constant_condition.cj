// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a constant condition remains diagnosed inside a reachable match case.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f


// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"

func matchBody(value: Bool) {
    match (value) {
        case true =>
            if (true) {
                println("reachable match body")
            } else {
                println("unreachable match body")
            }
        case false => println("other match body")
    }
}

main() {
    matchBody(true)
}
