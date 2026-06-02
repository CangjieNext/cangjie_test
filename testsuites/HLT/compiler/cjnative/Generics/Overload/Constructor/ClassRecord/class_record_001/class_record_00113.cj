/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A {}

open class C <: A {}

open class E <: C {}

open class B {}

open class D <: B {}

open class F <: D {}

class X {
    init(inp: (A, D)) {
        print("A_first")
    }
    init(inp: (C, B)) {
        print("A_second")
    }
}

struct Y {
    init(inp: (A, D)) {
        print("B_first")
    }
    init(inp: (C, B)) {
        print("B_second")
    }
}

main(): Int64 {
    var i = X((E(), F()))
    var j = Y((E(), F()))
    return 0
}
// ASSERT: scan sema_ambiguous_constructor_match
