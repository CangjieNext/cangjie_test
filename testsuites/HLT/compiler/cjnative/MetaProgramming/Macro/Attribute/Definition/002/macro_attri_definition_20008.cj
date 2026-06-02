/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_macro %f
// EXEC: %run_macro %compiler %cmp_opt main.cj  -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args

macro package define

import std.ast.*

class D {}

func x(input: Int64) {
    input
}

struct A<T> where T <: D {
    public var a: T
    private let b: Int64 = 1
    public static let c: Int64 = 1
    public init(input: T) {
        this.a = input
    }
    private init(input: T, input_b!: Int64 = 1) {
        var temp = input
        this.a = input
    }
    public static func x<X>() {}
    private func y() {}
    public func z() {}
    public operator func +(b: T) {
        0
    }
}

public macro M(attr: Tokens, input: Tokens): Tokens {
    A<D>(D())
    return quote(0)
}
