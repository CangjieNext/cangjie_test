/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

// e1?e2:e3 , only e1 is bottom type, whole type depend on e2 and e3.

func test(): Int64 {
    if (return true) {
        false
    } else {
        true
    }
}

main(): Int64 {
    if (test()) { // true
        return 0
    }
    return 1
}
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_mismatched_types
