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
    setItem("key1", "hello ")
    return input
}

public macro Outer(input: Tokens): Tokens {
    let messages = getChildMessages("Inner")
    for (m in messages) {
        let value1 = m.hasItem("key1")
        if (value1) {
            return input
        } else {
            return input + quote( + 1)
        }
    }
    return input
}
