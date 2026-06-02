/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f  -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

import define.*

@SAME
open class C1 {}

@SAME
class C2 <: C1 {}

@SAME
enum A<X, Y> where X <: C1, Y <: C2 {
    a
    | a(X)
    | a(X, Y)

    func f() {}
    static func s_f() {}
    operator func +(x: Int64) {}
    prop Z: Int64 {
        get() {
            1
        }
    }
    @SAME
    func test<Z>(x: Z) where Z <: X & Y {
        x
    }
}

@SAME
interface I {}

@SAME
extend<X, Y> A<X, Y> <: I where X <: C1, Y <: C2 {}

@SAME
main() {
    a<C1, C2>.test<C2>(C2())
    0
}
