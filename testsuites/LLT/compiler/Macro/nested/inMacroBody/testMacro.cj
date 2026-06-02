// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define_a

internal import std.ast.*

public macro testa(attr: Tokens) {
    attr
}

public macro testaa(attr: Tokens) {
    attr
}

public macro testaaa(attr: Tokens) {
    attr
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
