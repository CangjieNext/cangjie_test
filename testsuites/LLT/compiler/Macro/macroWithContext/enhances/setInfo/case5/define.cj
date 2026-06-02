// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import std.ast.*

func setItem(input: Tokens) {
    setItem("key1", quote(public func))
    setItem("key2", input)
    setItem("key3", Tokens())
}

public macro Inner(input: Tokens): Tokens {
    setItem(input)
    return input
}

func GetItem() {
    let messages = getChildMessages("Inner")
    for (m in messages) {
        let value1 = m.getTokens("key1")
        value1.dump()
        let value2 = m.getTokens("key2")
        value2.dump()
        let value3 = m.getTokens("key3")
        println(value3.size)
    }
}

public macro Outer(input: Tokens): Tokens {
    GetItem()
    return quote(1)
}
