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

open class Z1 {}

class Z2 <: Z1 {}

class A<X> where X <: Z2 {
    public func test<Y>(x: Y) where Y <: X {
        x
    }
}

main() {
    A<Z2>().test<Z2>(Z2())
    0
}
