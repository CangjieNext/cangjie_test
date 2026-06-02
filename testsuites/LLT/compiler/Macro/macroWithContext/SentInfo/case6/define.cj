// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

internal import std.ast.*

public macro Inner(attr: Tokens, input: Tokens): Tokens {
    assertParentContext("Outer")
    setItem("attr", attr.toString())
    setItem("input", input.toString())
    return input
}

public macro Inner1(attr: Tokens, input: Tokens): Tokens {
    assertParentContext("Outer")
    setItem("attr", attr.toString())
    setItem("input", input.toString())
    return input
}

public macro Inner2(attr: Tokens, input: Tokens): Tokens {
    assertParentContext("Outer")
    setItem("attr", attr.toString())
    setItem("input", input.toString())
    return input
}

public macro Outer(input: Tokens): Tokens {
    let messages = getChildMessages("Inner")

    var ret = Tokens()
    for (m in messages) {
        let value1 = m.getString("attr")
        let value2 = m.getString("input")
    }
    let messages1 = getChildMessages("Inner1")
    let messages2 = getChildMessages("Inner2")
    return input
}
