/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_nonexhuastive_patterns

enum EE {
    | A | B(Int8) | ...
}

main() {
    let value = match (B(1)) {
        case A => 1
        case B(x) => 0
    }
    value
}
