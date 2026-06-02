// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import std.ast.*

func setItem() {
    setItem("key1", "hello ")
    setItem("key2", "world")
}

public macro Inner(input: Tokens): Tokens {
    setItem()
    return input
}

func GetItem(input: Tokens) {
    let messages = getChildMessages("Inner")
    var ret = Tokens()
    for (m in messages) {
        let value1 = m.getString("key1")
        let value2 = m.getString("key2")
        return ret + Token(TokenKind.STRING_LITERAL, value1 + value2)
    }
    return input
}

public macro Outer(input: Tokens): Tokens {
    return GetItem(input)
}
