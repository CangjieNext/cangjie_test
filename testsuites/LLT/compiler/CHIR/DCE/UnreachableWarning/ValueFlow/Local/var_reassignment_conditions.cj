// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify the latest var assignment drives range analysis.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f


// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    var reassigned = 10
    reassigned = 20
    if (reassigned > 100) {
        println("unreachable var reassignment")
    }

    var tracked = 10
    tracked = 3
    if (tracked > 5) {
        println("unreachable var tracking")
    }
}
