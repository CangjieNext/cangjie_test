/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A {
    b(Int32)
}

main(): Int64 {
    let a = A.b(1)..A.b(10) : A.b(1)
    return 0
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
// ASSERT: scan sema_mismatched_types
