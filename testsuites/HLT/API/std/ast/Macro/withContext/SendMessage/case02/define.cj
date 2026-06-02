/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
macro package define

import std.ast.*

public macro Inner(input: Tokens): Tokens {
    assertParentContext("Outer")
    if (input.toString() == "var a = 1") {
        setItem("key1", "inner 1 hello ")
        setItem("key2", "world")
    } else {
        setItem("key1", "inner 2 hello ")
        setItem("key2", "world")
    }
    return input
}

public macro Outer(input: Tokens): Tokens {
    let messages = getChildMessages("Inner")
    var ret = Tokens()
    for (m in messages) {
        let value1 = m.getString("key1")
        let value2 = m.getString("key2")
        ret = ret + Token(TokenKind.STRING_LITERAL, value1 + value2)
        println(value1 + value2)
    }

    return input
}
