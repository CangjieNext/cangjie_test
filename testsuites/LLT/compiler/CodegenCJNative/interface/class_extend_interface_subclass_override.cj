// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// Regression test for issue #702: when a class implements an interface via
// extension, virtual dispatch on a subclass object must reach the subclass
// override at every optimization level.

interface I1 {
    func foo(): Int64 {
        2
    }
}

interface I2 {
    static func bar(): Int64 {
        -1
    }
}

open class A {
    public open func foo(): Int64 {
        1
    }
}

extend A {}

extend A <: I1 & I2 {}

class B <: A {
    public override func foo(): Int64 {
        super.foo() + 1
    }
}

class C <: A {}

interface IG<T> {
    func foo(): Int64 {
        3
    }
}

open class AG<T> {
    public open func foo(): Int64 {
        1
    }
}

extend<T> AG<T> <: IG<T> {}

class BG<T> <: AG<T> {
    public override func foo(): Int64 {
        10
    }
}

main() {
    // Dispatch through an interface reference must reach the override B.foo, which is 2.
    var i: I1 = B()
    if (i.foo() != 2) {
        return 1
    }
    // Dispatch through a class reference must also reach the override B.foo.
    var a: A = B()
    if (a.foo() != 2) {
        return 2
    }
    // A subclass without override still dispatches to A.foo, which is 1.
    var c: I1 = C()
    if (c.foo() != 1) {
        return 3
    }
    // Unconditional generic extension: dispatch on an instantiated subclass object
    // must reach the override BG<T>.foo, which is 10.
    var ig: IG<Int64> = BG<Int64>()
    if (ig.foo() != 10) {
        return 4
    }
    var ag: AG<Int64> = BG<Int64>()
    if (ag.foo() != 10) {
        return 5
    }
    return 0
}
