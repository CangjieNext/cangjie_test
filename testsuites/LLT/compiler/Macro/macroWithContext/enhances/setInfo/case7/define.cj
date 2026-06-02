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
        try {
            m.getBool("key1")
        } catch (e: Exception) {
            eprint(e.message)
        }

        try {
            m.getInt64("key2")
        } catch (e: Exception) {
            eprint(e.message)
        }

        try {
            m.getString("key3")
        } catch (e: Exception) {
            eprint(e.message)
        }

        try {
            m.getTokens("key4")
        } catch (e: Exception) {
            eprint(e.message)
        }

        try {
            m.getTokens("key6")
        } catch (e: Exception) {
            eprint(e.message)
        }
    }
    return input
}
