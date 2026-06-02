macro package def

import std.ast.*

public macro M0(input: Tokens): Tokens {
    input.dump()
    return input
}

public macro M1(input: Tokens): Tokens {
    let tks = quote(var x = 1)
    tks.dump()
    tks
}

public macro M2(input: Tokens): Tokens {
    let tks = cangjieLex("var x = 1")
    tks.dump()
    tks
}

public macro M3(input: Tokens): Tokens {
    var tks = Tokens()
    let tk0 = Token()
    tk0.dump()
    let tk1 = Token(TokenKind.IDENTIFIER, "a")
    tk1.dump()
    let tk2 = Token(TokenKind.INCR)
    tk2.dump()
    tks
}

func innerMacro4(): Tokens {
    return quote(var x = 1)
}

public macro M4(input: Tokens): Tokens {
    let tks = innerMacro4()
    tks.dump()
    tks
}

func innerMacro5(): Tokens {
    return cangjieLex("var x = 1")
}

public macro M5(input: Tokens): Tokens {
    let tks = innerMacro5()
    tks.dump()
    tks
}

func innerMacro6(): Tokens {
    var tks = Tokens()
    tks.append(Token())
    tks.append(Token(TokenKind.IDENTIFIER, "a"))
    tks.append(Token(TokenKind.INCR))
    return tks
}

public macro M6(input: Tokens): Tokens {
    let tks = innerMacro6()
    tks.dump()
    tks
}

public macro M7(input: Tokens): Tokens {
    println("input tokens: ")
    input.dump()
    var tks = input + Token(TokenKind.NL)
    println("input tokens add Token: ")
    tks.dump()

    tks = tks + quote(var x = 1;)
    println("input tokens add quote tokens: ")
    tks.dump()

    tks = tks + cangjieLex("x = 2")
    println("input tokens add cangjieLex tokens: ")
    tks.dump()

    tks
}

public macro M8(input: Tokens): Tokens {
    let tks = quote($(input[1]))
    tks.dump()
    input
}

public macro M9(input: Tokens): Tokens {
    let decl = parseDecl(input)
    decl.dump()
    decl.toTokens()
}

let a = quote(1)

public macro M10(input: Tokens): Tokens {
    a.dump()
    a
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
