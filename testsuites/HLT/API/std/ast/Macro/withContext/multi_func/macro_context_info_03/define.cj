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

class A {
    func temp_test_0() {
        assertParentContext("Outer")
        setItem("key1", "hello ")
        setItem("key2", "world")
    }
    func temp_test_1(input: Tokens) {
        let messages = getChildMessages("Inner")
        var ret = Tokens()
        for (m in messages) {
            let value1 = m.getString("key1")
            let value2 = m.getString("key2")
            return ret + Token(TokenKind.STRING_LITERAL, value1 + value2)
        }
        return input
    }
}

var a = A()

public macro Inner(input: Tokens): Tokens {
    a.temp_test_0()
    return input
}

public macro Outer(input: Tokens): Tokens {
    return a.temp_test_1(input)
}
