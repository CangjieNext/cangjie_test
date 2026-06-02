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
    setItem("key1", quote(1 + 1))
    setItem("key2", quote(public func))
    let key3 = '''
    Hello,
    Cangjie Lang'''
    setItem(key3, Tokens(Array(5, repeat: Token(COLON))))
    setItem("", cangjieLex("cangjie"))
    return input
}

public macro Outer(input: Tokens): Tokens {
    let messages = getChildMessages("Inner")
    let key3 = '''
    Hello,
    Cangjie Lang'''
    for (m in messages) {
        let value1 = m.getTokens("key1")
        let value2 = m.getTokens("key2")
        let value3 = m.getTokens(key3)
        let value4 = m.getTokens("")
        try {
            let value5 = m.getTokens("key3")
        } catch (e: Exception) {
        }
    }
    return input
}
