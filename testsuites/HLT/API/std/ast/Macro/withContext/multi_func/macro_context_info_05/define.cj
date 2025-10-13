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

func temp_test(input: Tokens) {
    let messages = getChildMessages("Inner")
    var ret = Tokens()
    for (m in messages) {
        let value1 = m.getString("key1")
        let value2 = m.getString("key2")
        return ret + Token(TokenKind.STRING_LITERAL, value1 + value2)
    }
    return input
}

func temp_test1() {
    assertParentContext("Outer")
    setItem("key1", "hello ")
    setItem("key2", "world")
}

public macro Inner(input: Tokens): Tokens {
    temp_test1()
    return input
}

public macro Outer(input: Tokens): Tokens {
    return temp_test(input)
}
