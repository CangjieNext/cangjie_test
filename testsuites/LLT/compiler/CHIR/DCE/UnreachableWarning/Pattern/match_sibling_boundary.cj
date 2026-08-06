// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify an or-pattern reaches later sibling cases without entering an unreachable case body.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-8 "DiagKind": "chir_unreachable_pattern"

main() {
    let selector = 1
    match (selector) {
        case 1 | 2 => ()
        case value where value > 0 =>
            match (true) {
                case true => ()
                case false => ()
            }
        case 3 => ()
        case _ => ()
    }

    let missing = 4
    match (missing) {
        case 2 | 3 where true => ()
        case _ => ()
    }

    let sibling = 1
    match (sibling) {
        case 1 => ()
        case 2 | 3 where true => ()
        case _ => ()
    }

    let tupleSelector = (5, 6)
    match (tupleSelector) {
        case (1, 2) | (3, 4) where true => ()
        case _ => ()
    }
}
