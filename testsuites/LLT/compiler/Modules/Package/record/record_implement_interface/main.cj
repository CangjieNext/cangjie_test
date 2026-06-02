// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/pkg.cj -o pkg/pkg.%middle
// EXEC: %compiler %cmp_opt pkg/pkg.%middle %n.cj --import-path pkg -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkg.*

public struct A <: I1 & I2 {
    public let a = 1
    private let b = 2
    public func g() {
        return b + a
    }
    public func f() {
        return b - a
    }
}

main(): Int64 {
    var test1: I1 = A()
    var test2: I2 = A()
    if (test1.g() == 3 && test2.f() == 1) {
        return 0
    }
    return 1
}
