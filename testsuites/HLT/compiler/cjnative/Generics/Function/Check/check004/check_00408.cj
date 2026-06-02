/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: 407.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt 407.cj -o 407.%middle
// ERRCHECK: %compiler %cmp_opt %f 407.%middle -o %output

import test407

open class A<X, Y> {
    static func test(a: Int64, b: Int64, c: Y) {}
    static func test(a: Int64, b: Int64, c: X) {}
}

struct B<X, Y> {
    static func test(a: Int64, b: Int64, c: Y) {}
    static func test(a: Int64, b: Int64, c: X) {}
}

interface C<X, Y> {
    static func test(a: Int64, b: Int64, c: Y) {}
    static func test(a: Int64, b: Int64, c: X) {}
}

func test<X>(input: C<X, X>) {
    A<X, X>()
    B<X, X>()
    var c: C<X, X>
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
