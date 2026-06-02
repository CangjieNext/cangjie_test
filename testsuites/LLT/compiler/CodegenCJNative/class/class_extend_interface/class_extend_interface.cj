// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I {
    func f(): Int64 {
        0
    }
}

interface I1 {
    func f(a: Int64): Int64
}

interface I2 {
    func f(a: Int64, b: Int64): Int64
}

interface I3 {
    func f(a: Int64, b: Int64, c: Int64): Int64 {
        a + b + c
    }
}

interface I4 {
    func g(): Int64
}

class A <: I {
    public func f(): Int64 {
        3
    }
    public func g(): Int64 {
        4
    }
}

extend A <: I1 & I2 & I3 {
    public func f(a: Int64): Int64 {
        100 + a
    }
    public func f(a: Int64, b: Int64): Int64 {
        a + b
    }
}

extend A <: I4 {}

main() {
    var a: I = A()
    var b: I1 = A()
    var c: I2 = A()
    var d: I3 = A()
    var e: I4 = A()
    if (a.f() + b.f(1) + c.f(400, 1000) + d.f(1, 2, 3) + e.g() == 3 + 101 + 1400 + 6 + 4) {
        return 0
    }
    return 1
}

/*
// Boxed type
    class $BOX_A {
        var $value : A
        init($value : A) {
            this.$value = $value
        }
    }
    class $BOX_A_default <: $BOX_A & I1 & I2 & I3 & I4 {
        init($value: A) {
            super($Value)
        }
        func g() {
            return $value.g()
        }
        ...
    }
 */
