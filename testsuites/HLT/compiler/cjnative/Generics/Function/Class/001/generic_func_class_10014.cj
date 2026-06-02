/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Z1 {}

class Z2 <: Z1 {}

class A<X> where X <: Z1 {
    public func test<Y>(x: Y) where Y <: A<X> {
        x
    }
}

main() {
    A<Z2>().test<A<Z2>>(A<Z2>())
    0
}
