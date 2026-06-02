// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define_a

internal import std.ast.*

public macro testa(input: Tokens) {
    input
}

public macro testaa(input: Tokens) {
    quote(1 + 2)
}

public macro testaaa(input: Tokens) {
    input
}

public macro testAttr(attr: Tokens, input: Tokens) {
    attr + input
}

public macro testAttr2(attr: Tokens, input: Tokens) {
    input
}

public macro testaQuote(attr: Tokens) {
    quote(quote(\$input))
}
