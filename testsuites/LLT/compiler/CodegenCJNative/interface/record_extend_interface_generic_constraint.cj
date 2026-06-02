// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I1 {
    func g(): Int64 {
        0
    }
}

interface I2 {
    func f(): Int64 {
        0
    }
}

interface I3 {
    func k(): Int64 {
        0
    }
}

struct A {
    public func k(): Int64 {
        123
    }
}

extend A <: I1 {
    public func g() {
        456
    }
}

extend A {}

extend A <: I2 & I3 {
    public func f() {
        789
    }
}

func g<T>(b: T) where T <: I1 {
    b.g()
}

func f<T>(b: T) where T <: I2 {
    b.f()
}

func k<T>(b: T) where T <: I3 {
    b.k()
}

main() {
    var b = A()
    if (b.g() != 456) {
        return 1
    }
    if (b.f() != 789) {
        return 1
    }
    if (b.k() != 123) {
        return 1
    }
    if (g(b) != 456) {
        return 1
    }
    if (f(b) != 789) {
        return 1
    }
    if (k(b) != 123) {
        return 1
    }
    return 0
}
