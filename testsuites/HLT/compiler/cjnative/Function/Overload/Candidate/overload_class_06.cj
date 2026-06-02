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
    var a: B = B(1)
    var b = a.foo(a)
    if (b.b != 1) {
        return 1
    }
    var c: A = a.foo(a)
    if (c.a != 2) {
        return 2
    }
    return 0
}

open class A {
    public var a: Int32
    public init(x: Int32) {
        a = x + 1
    }
    public open func foo(x: B) {
        return A(1)
    }
}

class B <: A {
    public var b: Int32
    public init(x: Int32) {
        super(x)
        b = x
    }
    public override func foo(x: B) {
        return B(1)
    }
}
