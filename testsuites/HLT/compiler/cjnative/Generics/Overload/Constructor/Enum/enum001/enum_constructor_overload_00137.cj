/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A {}

open class D <: A {}

open class G <: D {}

open class B {}

open class E <: B {}

open class H <: E {}

open class C {}

open class F <: C {}

open class I <: F {}

enum X {
    a((A, B, C))
}

enum Y {
    a((A, B, F))
}

enum Z {
    a((D, E, F))
}

main(): Int64 {
    var j = a((G(), H(), I()))
    var res_j: Int64 = match (j) {
        case _: Z => 0
        case _ => 1
    }
    return res_j
}
// ASSERT: scan sema_multiple_constructor_in_enum
