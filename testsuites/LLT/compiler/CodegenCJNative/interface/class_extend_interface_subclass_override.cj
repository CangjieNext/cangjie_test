// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// Regression test for Cangjie/cangjie_compiler issue #702: when a non-generic class implements an
// interface through an unconditional extension, virtual dispatch on a subclass object must reach
// the subclass override at every optimization level.

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

main() {
    // Dispatch through an interface reference must reach B.foo, which returns 2.
    var i: I1 = B()
    if (i.foo() != 2) {
        return 1
    }
    // Dispatch through a class reference must reach the same override.
    var a: A = B()
    if (a.foo() != 2) {
        return 2
    }
    // A subclass without an override still dispatches to A.foo, which returns 1.
    var c: I1 = C()
    if (c.foo() != 1) {
        return 3
    }
    return 0
}
