macro package define

import std.ast.*

public macro M1(input: Tokens) {
    println(input.toTokens())
    return input
}

public macro M2(input: Tokens) {
    let tks = quote(var a = 'hello')
    let d = parseDecl(tks)
    println(d.toTokens())
    return tks
}

public macro M3(input: Tokens) {
    let tks = quote(var b = "hello")
    let d = parseDecl(tks)
    println(d.toTokens())
    return tks
}

public macro M4(input: Tokens) {
    let tks = cangjieLex("var a = 'hello'")
    println(tks.toTokens())
    return tks
}

public macro M5(input: Tokens) {
    let tks = cangjieLex('var b = "hello"')
    println(tks.toTokens())
    return tks
}

public macro OQL(input: Tokens) {
    var alias_name: String = "a"
    var condition_name: String = "c"
    for (tk in input) {
        match (tk.kind) {
            case SINGLE_QUOTED_STRING_LITERAL => // process single quoted string
                alias_name = tk.value
            case STRING_LITERAL => // process double quoted string
                condition_name = tk.value
            case _ => continue
        }
    }
    return quote(
        let alias_name = $(alias_name)
        let condition_name = $(condition_name)
    )
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
