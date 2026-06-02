// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package test

internal import std.ast.*

// 1.macro definition
public macro callTest(input: Tokens): Tokens {
    return input
}

public macro callTest(attr: Tokens, input: Tokens): Tokens {
    return input
}

public macro MultiParam1(input: Tokens): Tokens {
    var ret1 = quote(var a: Int8 = 0)
    var ret2 = quote(var b: Int8 = 1)
    return ret1 + ret2
}

public macro MultiParam2(attr: Tokens, input: Tokens): Tokens {
    var ret1 = quote(var c: Int8 = 2)
    var ret2 = quote(var d: Int8 = 3)
    return ret1 + ret2
}

public macro Zero(attrs: Tokens, input: Tokens) {
    return quote(0)
}

public macro UnitLitSame(input: Tokens) {
    var lit = (parseExpr(input) as LitConstExpr).getOrThrow()
    return quote($(lit))
}

public macro DeclM(input: Tokens) {
    return quote($(parseDecl(input)))
}

public macro VAR(input: Tokens) {
    quote($((parseDecl(input) as VarDecl).getOrThrow()))
}

public macro B3(input: Tokens): Tokens {
    return quote(public enum EEB{
        |ABC
        public func ab(){}       
    })
}
