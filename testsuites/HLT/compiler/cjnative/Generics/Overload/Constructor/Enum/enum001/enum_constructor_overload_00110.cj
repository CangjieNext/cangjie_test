/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum B {
    a
}

enum A<T> {
    a
}

main(): Int64 {
    var i = a<Int64>
    var res_i: Int64 = match (i) {
        case _: A<Int64> => 0
        case _ => 1
    }
    var j = a
    var res_j: Int64 = match (j) {
        case _: B => 0
        case _ => 1
    }
    return res_i + res_j
}
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan sema_multiple_constructor_in_enum
