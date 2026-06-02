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

struct A {
    public var a: Int64
    private let b: Int64 = 1
    public static let c: Int64 = 1
    public init(input: Int64) {
        this.a = input
    }
    private init(input: Int32) {
        this.a = Int64(input)
    }
    public static func x() {}
    private func y() {}
    public func z() {}
    public func test() {}
    public operator func +(b: A) {
        0
    }
}

public macro M(attr: Tokens, input: Tokens): Tokens {
    A(1)
    return quote(0)
}
