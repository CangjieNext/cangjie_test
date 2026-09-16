// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify that an unreachable successor does not recursively enter the shared
// continuation and report the reachable second if at any optimization level.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -O0 -o %output 2>&1 | compare %f

// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -O1 -o %output 2>&1 | compare %f

// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -O2 -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    var judge = true
    if (judge) {
        println("first")
    }

    judge = false
    if (!judge) {
        println("second")
    }

    if (false) {
        println("constant")
    }
}
