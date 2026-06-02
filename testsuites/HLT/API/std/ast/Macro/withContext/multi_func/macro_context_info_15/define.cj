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
    func test2() {
        assertParentContext("Outer")
    }
    static func test() {
        setItem("key1", 1)
    }
}

public macro Inner(input: Tokens): Tokens {
    var a = A()
    setItem("key1", 1)
    return input
}

func test() {
    let messages = getChildMessages("Inner1")
    return messages
}

public macro Outer(input: Tokens): Tokens {
    var a = test().size
    return input + quote( + $(a))
}
