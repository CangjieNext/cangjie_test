/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<X, Y> {
    static func test(a: Int64, b: Int64, c: X) {}
    static func test(a: Int64, b: X, c: X) {}
}

struct B<X, Y> {
    static func test(a: Int64, b: Int64, c: X) {}
    static func test(a: Int64, b: X, c: X) {}
}

enum C<X, Y> {
    E

    static func test(a: Int64, b: Int64, c: X) {}
    static func test(a: Int64, b: X, c: X) {}
}

main(): Int64 {
    A<Int64, Int64>.test(1, 1, 1)
    B<Int64, Int64>.test(1, 1, 1)
    C<Int64, Int64>.test(1, 1, 1)
    return 0
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
// ASSERT: scan sema_ambiguous_match
