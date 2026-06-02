/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

open class C1 {}

class C2 <: C1 {}

enum A<X, Y> where X <: C1, Y <: C2 {
    a

    public func test<Z>(x: Z) where Z <: X & Y {
        x
    }
}

main() {
    a<C2, C2>.test<C2>(C2())
    0
}
