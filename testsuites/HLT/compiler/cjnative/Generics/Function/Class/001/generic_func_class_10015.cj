/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Z1 {}

class Z2 <: Z1 {}

class A<X> where X <: Z1 {
    public func test<Y>(x: Y) where Y <: A<X> {
        x
    }
}

main() {
    A<Z2>().test<A<Z1>>(A<Z1>())
    0
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
