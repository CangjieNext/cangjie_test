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

public macro Outer(input: Tokens) {
    return input
}

class A {
    func test() {
        insideParentContext("Outer")
    }
}

public macro Inner(input: Tokens) {
    if (test()) {
        println(true)
        return input + quote(+ 1)
    } else {
        println(false)
        return input
    }
}
