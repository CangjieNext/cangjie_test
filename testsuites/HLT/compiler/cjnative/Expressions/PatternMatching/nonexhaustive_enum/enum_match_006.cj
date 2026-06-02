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
    | A1(Int64) | B1(Int8) | C1 | ...
}

main() {
    let value = match (B1(1)) {
        case A1(x) => 1
        case B1(y) => 0
        case C1 => 3
        case x where x is EE =>
            x
            1
    }
    value
}
