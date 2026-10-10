/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package indents

import std.ast.*

public macro dprint(input: Tokens): Tokens {
    let inputStr = input.toString()
    let result = quote(
            print($(inputStr) + " = ")
        println($(input)))
    return result
}

public macro deepMacro(input: Tokens): Tokens {
    if (true) {
        for (i in 0..2) {
            println("iter ${i}")
        }
    }
    return input
}
