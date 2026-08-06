// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A tuple index of a const tuple contributes a compile-time condition.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    const pair = (1, 2)
    const first = pair[0]
    if (first < 0) {
        println("unreachable const tuple index condition")
    }
}
