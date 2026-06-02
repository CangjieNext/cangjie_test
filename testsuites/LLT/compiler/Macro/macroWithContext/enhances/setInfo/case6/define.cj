// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import std.ast.*

public macro Inner(input: Tokens): Tokens {
    setItem("key1", quote(public func))
    setItem("key2", "hello")
    setItem("key3", input)
    setItem("key4", 1)
    setItem("key5", true)
    return input
}

public macro Outer(input: Tokens): Tokens {
    let messages = getChildMessages("Inner")
    for (m in messages) {
        let value1 = m.getTokens("key1")
        value1.dump()
        let value2 = m.getString("key2")
        println(value2)
        let value3 = m.getTokens("key3")
        value3.dump()
        let value4 = m.getInt64("key4")
        println(value4)
        let value5 = m.getBool("key5")
        println(value5)
    }
    return quote(1)
}
