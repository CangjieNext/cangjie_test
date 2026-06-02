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

main() {
    let x = match ((true, true)) {
        case (true, true) | (true, false) | (true, true) where prove_riemann_hypothesis() => 0
        case (true, true) | (true, false) | (true, true) => 1
        case (true, true) | (true, false) | (true, true) where !prove_riemann_hypothesis() => 2
    }
    x
}
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan sema_nonexhuastive_patterns
