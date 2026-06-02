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
    var e = y.goo(x) // goo1
    if (e.a != 2) {
        return 1
    }
    var f: A = y.goo(y) // goo1
    if (f.a != 2) {
        return 2
    }
    var g = y.goo(y) // goo2
    if (g.b != 1) {
        return 3
    }
    return 0
}

open class A {
    public var a: Int32
    public init(x: Int32) {
        a = x + 1
    }
    public func goo(x: A) { // goo1
        return A(1)
    }
}

class B <: A {
    public var b: Int32
    public init(x: Int32) {
        super(x)
        b = x
    }
    public func goo(x: B) { // goo2
        return B(1)
    }
}
