// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define_a

internal import std.ast.*

var cnt = 0

public macro testa(input: Tokens) {
    if (cnt == 0) {
        cnt++
        return quote(1 + @testa(2 + @testa(2)) + 1)
    }
    quote(1)
}

public macro testaa(input: Tokens) {
    quote(1 + 2)
}

public macro testaaa(input: Tokens) {
    quote(1 + @testaa(1))
}

public macro testAttr(attr: Tokens, input: Tokens) {
    if (cnt == 0) {
        cnt++
        return quote(1 + @testaa(1) + @testAttr[1](2))
    }
    quote(1)
}

public macro testAttr2(attr: Tokens, input: Tokens) {
    if (cnt == 0) {
        cnt++
        return quote(1 + @testAttr[1](1) + testAttr2[1](2))
    }
    quote(1)
}

public macro testaQuote(attr: Tokens) {
    quote(quote(\$input))
}

public macro MMMM(a: Tokens) {
    return a
}
