// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import std.ast.*

func SetItem1(attr: Tokens, input: Tokens) {
    setItem("attr", attr.toString())
    setItem("input", input.toString())
}

public macro Inner1(attr: Tokens, input: Tokens): Tokens {
    SetItem1(attr, input)
    return input
}

func SetItem2(attr: Tokens, input: Tokens) {
    setItem("attr", attr.toString())
    setItem("input", input.toString())
}

public macro Inner2(attr: Tokens, input: Tokens): Tokens {
    SetItem2(attr, input)
    return input
}

func GetItem(input: Tokens) {
    var value = ""
    let messages1 = getChildMessages("Inner1")
    for (m in messages1) {
        value = value + m.getString("attr")
    }
    let messages2 = getChildMessages("Inner2")
    for (m in messages2) {
        value = value + m.getString("attr")
    }
    return Tokens(Token(TokenKind.STRING_LITERAL, value))
}

public macro Outer(input: Tokens): Tokens {
    return GetItem(input)
}
