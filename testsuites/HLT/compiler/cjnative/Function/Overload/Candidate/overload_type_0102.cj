/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var x = A(1)
    var a: B = foo(x) // foo3
    if (a.b != 0) {
        return 1
    }
    var c: B = foo(x) // foo3
    if (c.b != 0) {
        return 3
    }
    return 0
}

open class A {
    public var a: Int32
    public init(x: Int32) {
        a = x + 1
    }
}

class B <: A {
    public var b: Int32
    public init(x: Int32) {
        super(x)
        b = x
    }
}

func foo(x: A): A {
    return x
} // foo1

func foo(x: A, y!: A = A(0)): A {
    return B(0)
} // foo2

func foo(x: A, y!: B = B(0)): B {
    return B(0)
} // foo3

func foo(x: B): A {
    return A(1)
} // foo4

func foo(x: B, y!: A = A(0)): A {
    return B(1)
} // foo5

func foo(x: B, y!: B = B(0)): B {
    return B(1)
} // foo6

func goo(x: A): B {
    return B(0)
}
