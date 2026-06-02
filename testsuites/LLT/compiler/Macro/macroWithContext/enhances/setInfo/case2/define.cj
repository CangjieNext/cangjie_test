// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import std.ast.*

func setItem() {
    setItem("key1", 1)
    setItem("key2", 2)
}

public macro Inner(input: Tokens): Tokens {
    setItem()
    return input
}

func GetItem(input: Tokens) {
    let messages = getChildMessages("Inner")
    var ret = Tokens()
    for (m in messages) {
        let value1 = m.getInt64("key1")
        let value2 = m.getInt64("key2")
        return ret + Token(TokenKind.INTEGER_LITERAL, value1.toString() + value2.toString())
    }
    return input
}

public macro Outer(input: Tokens): Tokens {
    return GetItem(input)
}
