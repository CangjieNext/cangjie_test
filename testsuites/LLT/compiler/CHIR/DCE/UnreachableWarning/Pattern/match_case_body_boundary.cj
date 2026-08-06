// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify sibling-case traversal does not enter a nested match in an unreachable binding case body.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_unreachable_pattern"

main() {
    let selector = 1
    match (selector) {
        case 1 => 0
        case value =>
            match (true) {
                case true => 0
                case false => 1
            }
    }
}
