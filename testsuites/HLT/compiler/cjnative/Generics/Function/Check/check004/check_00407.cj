/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: 407.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt 407.cj
// ERRCHECK: %compiler %cmp_opt %f -o %output

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

func test<X>() {
    A<X, X>.test(1, 1, X())
    B<X, X>.test(1, 1, X())
    C<X, X>.test(1, 1, X())
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
// ASSERT: scan sema_invalid_field_expose_access
