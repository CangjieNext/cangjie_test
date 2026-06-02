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

interface I4 <: I1 {}

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

class A<T> {
    public func k(): Int64 {
        123
    }
}

extend<T> A<T> <: I4 {
    public func g() {
        456
    }
}

extend<T> A<T> <: I2 & I3 {
    public func f() {
        789
    }
}

main() {
    var b: I1 = A<Int64>()
    if (b.g() != 456) {
        return 1
    }
    var c: I2 = A<Int64>()
    if (c.f() != 789) {
        return 1
    }
    var d: I3 = A<Int64>()
    if (d.k() != 123) {
        return 1
    }
    return 0
}
