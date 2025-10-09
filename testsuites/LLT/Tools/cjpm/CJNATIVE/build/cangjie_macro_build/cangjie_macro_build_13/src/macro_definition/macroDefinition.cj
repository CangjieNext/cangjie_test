// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package b.macro_definition

internal import std.ast.*

open class A {
    public var a = 1
}

class B <: A {
    public func test() {
        super.a
    }
}

public macro M(attr: Tokens, input: Tokens): Tokens {
    if (B().test() != 1) {
        return quote(1)
    }
    return quote(0)
}
