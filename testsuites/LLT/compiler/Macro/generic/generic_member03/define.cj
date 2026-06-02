// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

internal import std.ast.*

public macro M1(input: Tokens): Tokens {
    quote(
    public class A {
        public func foo<T>(a: T) {a}
    }
    )
}

public macro M2(input: Tokens): Tokens {
    quote(
    public func test<T>(b: T) {b}
    )
}

public macro M3(input: Tokens): Tokens {
    quote(
    public struct C {
        public func foo<T>(c: T) {c}
    }
    )
}
