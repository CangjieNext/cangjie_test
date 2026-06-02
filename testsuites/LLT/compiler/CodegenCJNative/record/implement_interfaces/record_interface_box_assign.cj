// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I1 {
    func g(): Int64
}

interface I2 {
    func f(): Int64
}

struct A <: I1 & I2 {
    public let a = 1
    private let b = 2
    public func g() {
        return b + a
    }
    public func f() {
        return b - a
    }
}

func ggg() {
    func g() {
        var test1: I1
        test1 = A()
        test1.g()
    }
}

main(): Int64 {
    var test1: I1
    test1 = A()
    var test2: I2
    test2 = A()
    if (test1.g() == 3 && test2.f() == 1) {
        return 0
    }
    return 1
}
