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

interface T {
    operator func +(b: Int64): Unit
}

extend Unit <: T {
    public operator func +(b: Int64): Unit {}
}

func test<X>(a: X) where X <: T {
    a + Int64(1)
}

struct R<X> where X <: T {
    public var i: X
    public init(input: X) {
        let a: Unit = input + 1
        i = input
    }
}

enum E<X> where X <: T {
    e
}

class C<X> where X <: T {
    public init(input: X) {
        let a: Unit = input + Int64(1)
    }
}

interface I<X> where X <: T {
}

extend<X> R<X> <: T where X <: T {
    public operator func +(b: Int64): Unit {
        this.i + b
        return
    }
}

main(): Int64 {
    test<Unit>(())
    R<Unit>(())
    E<Unit>.e
    C<Unit>(())
    func foo(input: I<Unit>) {}
    return 0
}
