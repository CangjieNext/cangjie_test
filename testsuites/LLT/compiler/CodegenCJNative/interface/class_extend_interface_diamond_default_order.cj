// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// Two extension paths can implement sibling interfaces that share a parent. A default method from
// the more specific interface must be used regardless of which extension is visited first, and
// regardless of whether that extension belongs to the class itself or to an ancestor.

interface I {
    func f(): Int64 {
        0
    }
}

interface J1 <: I {}

interface J2 <: I {
    func f(): Int64 {
        2
    }
}

// Ancestor implements J1, the class itself implements J2.
open class A1 {}
extend A1 <: J1 {}
class B1 <: A1 {}
extend B1 <: J2 {}

// Ancestor implements J2, the class itself implements J1.
open class A2 {}
extend A2 <: J2 {}
class B2 <: A2 {}
extend B2 <: J1 {}

// The same ancestor implements both sibling interfaces.
open class A3 {}
extend A3 <: J1 {}
extend A3 <: J2 {}
class B3 <: A3 {}

main(): Int64 {
    let value1: I = B1()
    if (value1.f() != 2) {
        return 1
    }
    let value2: I = B2()
    if (value2.f() != 2) {
        return 2
    }
    let value3: I = B3()
    if (value3.f() != 2) {
        return 3
    }
    return 0
}
