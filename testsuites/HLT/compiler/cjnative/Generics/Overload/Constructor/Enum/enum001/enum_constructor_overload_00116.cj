/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

enum B<X> {
    a(X)
}

enum A<X> {
    a(X)
}

main(): Int64 {
    var j = a<Int64>(1)
    var res_j: Int64 = match (j) {
        case _: A<Int64> => 0
        case _ => 1
    }
    return res_j
}
// ASSERT: scan sema_multiple_constructor_in_enum
