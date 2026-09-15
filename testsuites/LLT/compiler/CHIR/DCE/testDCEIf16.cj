// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args %output 

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    if (true) {
    } else if (true) {
        var b = 2
    } else {
        var c = 3
    }
    0
}
