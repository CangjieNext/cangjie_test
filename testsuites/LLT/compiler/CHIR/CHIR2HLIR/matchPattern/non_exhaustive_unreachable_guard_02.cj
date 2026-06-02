// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj %diag_json -o %output 2>&1 | compare %f

func prove_riemann_hypothesis() {
    // Do a lot of magic
    true
}

enum E {
    | A(Bool)
    | A(String, Bool)
    | B(Bool)
}

main() {
    let x = match ((true, A(true))) {
        case (true, A(true)) where prove_riemann_hypothesis() => 0
        case (true, A("ABC", true)) | (true, A("DEF", true)) | (true, A("\u{41}\u{42}\u{43}", true)) => 1
        case (false, B(false)) where !prove_riemann_hypothesis() => 2
        case (true, A(true)) | (true, A(false)) | (true, A(true)) => 3
    }
    x
}
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan sema_nonexhuastive_patterns
