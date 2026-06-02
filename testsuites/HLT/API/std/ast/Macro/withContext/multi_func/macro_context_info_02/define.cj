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
import pkg1.*

public macro Inner(input: Tokens): Tokens {
    var a = A()
    assertParentContext("Outer")
    test1()
    return input
}

public macro Outer(input: Tokens): Tokens {
    let messages = getChildMessages("Inner")
    var ret = Tokens()
    for (m in messages) {
        let value1 = m.getBool("key1")
        if (value1) {
            return input
        } else {
            return Tokens()
        }
    }
    return input
}
