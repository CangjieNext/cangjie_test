// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// Regression test for Cangjie/cangjie_compiler issue #702: an open subclass may override an open
// method without repeating the `override` modifier. When its ancestor implements an interface via
// an unconditional extension, dispatch through the ancestor reference must still reach the
// subclass method instead of the ancestor's function table.

interface I {
    func f(): Int64
}

open class A {
    public open func f(): Int64 {
        1
    }
}

extend A <: I {}

open class B <: A {
    public func f(): Int64 {
        2
    }
}

main(): Int64 {
    let a: A = B()
    println("r=${a.f()}")
    if (a.f() != 2) {
        return 1
    }
    0
}
