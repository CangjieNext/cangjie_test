// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// An unreachable sibling case is diagnosed once; its nested match body is not revisited.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_unreachable_pattern"

main() {
    let selector = 1
    match (selector) {
        case 1 => 0
        case 2 =>
            match (true) {
                case true => 0
                case false => 1
            }
        case _ => 0
    }
}
