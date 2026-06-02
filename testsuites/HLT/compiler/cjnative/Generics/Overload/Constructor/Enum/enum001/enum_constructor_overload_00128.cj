/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I3 {}

interface I4 <: I3 {}

interface I2 <: I4 {}

interface I1 <: I2 & I3 {}

class C1 <: I1 {}

enum B {
    a(I3)
}

enum A {
    a(I4)
}

main(): Int64 {
    var j = a(C1())
    var res_j: Int64 = match (j) {
        case _: A => 0
        case _ => 1
    }
    return res_j
}
// ASSERT: scan sema_multiple_constructor_in_enum
