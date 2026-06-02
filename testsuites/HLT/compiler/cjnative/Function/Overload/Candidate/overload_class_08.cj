/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var x: A = A(1)
    var y: B = B(1)
    var b = y.foo(x) // foo2
    if (b.b != 1) {
        return 1
    }
    var c: A = y.foo(y) // foo1
    if (c.a != 2) {
        return 2
    }
    var d = y.foo(y) // foo1
    if (d.a != 2) {
        return 2
    }
    return 0
}

open class A {
    public var a: Int32
    public init(x: Int32) {
        a = x + 1
    }
    public func foo(x: B) { // foo1
        return A(1)
    }
}

class B <: A {
    public var b: Int32
    public init(x: Int32) {
        super(x)
        b = x
    }
    public func foo(x: A) { // foo2
        return B(1)
    }
}
