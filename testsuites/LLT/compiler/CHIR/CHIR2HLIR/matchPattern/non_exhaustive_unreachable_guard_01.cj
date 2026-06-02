// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj %diag_json -o %output 2>&1 | compare %f

func prove_riemann_hypothesis() {
    // Do a lot of magic that may be unknown at compile-time
    true
}

enum E {
    | A(Bool)
    | A(Bool, Bool)
    | B(Bool)
}

main() {
    let x = match ((A(true), B(true))) {
        case (A(true), B(true)) where prove_riemann_hypothesis() => 0
        case (A(false), B(false)) | (A(false), B(true)) | (A(false), B(false)) => 1
        case (A(false), B(false)) where !prove_riemann_hypothesis() => 2
    }
    x
}
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan sema_nonexhuastive_patterns
