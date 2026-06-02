// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package pkg1

internal import std.ast.*

public macro Foo(input: Tokens) {
    return quote(1)
}

public macro M(attr: Tokens, input: Tokens) {
    return input
}

public macro Entry2(input: Tokens): Tokens {
    var decl = parseDecl(input)
    return quote($decl)
}

public macro Entry(input: Tokens): Tokens {
    var decl = parseDecl(input)
    return quote($decl)
}
