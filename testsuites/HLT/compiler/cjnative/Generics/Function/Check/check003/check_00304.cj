/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A<X, Y> {
    func test(a: Int64, b: Int64, c: Int64) {}
    func test(a: Int64, b: Int64, c: X) {}
}

struct B<X, Y> {
    func test(a: Int64, b: Int64, c: Int64) {}
    func test(a: Int64, b: Int64, c: X) {}
}

interface C<X, Y> {
    func test(a: Int64, b: Int64, c: Int64) {}
    func test(a: Int64, b: Int64, c: X) {}
}

class Z<T> {}

main(): Int64 {
    Z<A<Int64, Int64>>()
    Z<B<Int64, Int64>>()
    Z<C<Int64, Int64>>()
    return 0
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
