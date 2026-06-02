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
    static func test(a: Int64, b: Int64, c: Y) {}
    static func test(a: Int64, b: Int64, c: X) {}
}

struct B<X, Y> {
    static func test(a: Int64, b: Int64, c: Y) {}
    static func test(a: Int64, b: Int64, c: X) {}
}

enum C<X, Y> {
    E

    static func test(a: Int64, b: Int64, c: Y) {}
    static func test(a: Int64, b: Int64, c: X) {}
}

func test<T>(input: T) {
    A<T, T>.test(1, 1, input)
    B<T, T>.test(1, 1, input)
    C<T, T>.test(1, 1, input)
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
// ASSERT: scan sema_ambiguous_match
