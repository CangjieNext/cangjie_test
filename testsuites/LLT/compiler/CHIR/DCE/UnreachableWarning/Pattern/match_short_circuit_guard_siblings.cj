// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify an unreachable short-circuit guard still leads to later source cases.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-4 "DiagKind": "chir_unreachable_pattern"

main() {
    const selector = 1
    match (selector) {
        case 1 => 0
        case value where (value > 0 && value < 10) || value == 20 => 1
        case 2 => 2
        case 3 => 3
        case _ => 4
    }
}
