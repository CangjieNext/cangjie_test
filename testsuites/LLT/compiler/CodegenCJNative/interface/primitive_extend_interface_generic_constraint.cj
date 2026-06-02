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

extend Int64 <: I1 {
    public func g() {
        456
    }
}

extend Int64 <: I2 & I3 {
    public func f() {
        789
    }
    public func k() {
        123
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
    var b = 1
    if (g(b) != 456) {
        return 1
    }
    var c = 2
    if (f(c) != 789) {
        return 1
    }
    var d = 3
    if (k(d) != 123) {
        return 1
    }
    return 0
}
