// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I1 {
    func g(c: Int64): Int64
}

interface I2 {
    func f(d: Int64): Int64
}

struct A <: I1 & I2 {
    public let a = 1
    private let b = 2
    public func g(c: Int64) {
        return b + a - c
    }
    public func f(d: Int64) {
        return b - a + d
    }
}

main(): Int64 {
    var test1: I1 = A()
    var test2: I2 = A()
    if (test1.g(3) == 0 && test2.f(2) == 3) {
        return 0
    }
    return 1
}
