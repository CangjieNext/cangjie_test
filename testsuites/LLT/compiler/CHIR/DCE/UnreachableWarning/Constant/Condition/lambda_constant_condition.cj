// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a constant condition remains diagnosed inside a lambda.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f


// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    let double = { value: Int64 =>
        if (true) {
            value * 2
        } else {
            0
        }
    }
    println(double(1))
}
