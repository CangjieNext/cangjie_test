/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A_second
// ASSERT: scan B_second

open class A {}

open class C <: A {}

open class E <: C {}

open class B {}

open class D <: B {}

open class F <: D {}

class X {
    public init(inp: (A, B)) {
        print("A_first")
    }
    public init(inp: (C, D)) {
        print("A_second")
    }
}

struct Y {
    public init(inp: (A, B)) {
        print("B_first")
    }
    public init(inp: (C, D)) {
        print("B_second")
    }
}

main(): Int64 {
    var i = X((E(), F()))
    var j = Y((E(), F()))
    return 0
}
