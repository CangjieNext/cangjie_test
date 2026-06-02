// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package view

internal import std.ast.*

func foo(input: Tokens): Tokens {
    var expr = parseExpr(input)
    let a = quote( + 4 + 5 + 6)
    return quote($expr) + a
}

func bar(input: Tokens): Tokens {
    return input
}

public macro callView(input: Tokens): Tokens {
    let v = input
    let tokens = cangjieLex("1 + 2 + 3")
    var expr = parseExpr(tokens)
    let a = bar(foo(quote( 1 + 2 + 3)))
    return quote(4 + $expr)
}

public macro test(input: Tokens): Tokens {
    let tokens = cangjieLex("1 + 2 + 3")
    var expr = parseExpr(tokens)

    // VarDecl InitExpr
    let a = quote(4 + 5 + 6 +)

    // AssignExpr
    var b: Tokens = cangjieLex("1 + 2 + 3")
    b = quote(7 + 8 + 9)

    // AssignExpr
    var c: Tokens
    c = quote(7 + 8 + 9)

    // ForInExpr   IfExpr   ArraySizedLit
    var ts = Array<Tokens>(1, repeat: quote(7 + 8 + 9))
    for (t in ts where true) {
        t.dump()
    }

    let f = a + quote(7 + 8 + 9)
    f.dump()

    // Func Body
    quote(7 + 8 + 9)

    // BinaryExpr
    return a + quote($expr)
}

public macro test2(input: Tokens): Tokens {
    var expr = parseExpr(input)
    let a = quote(4 + 5 + 6)

    // LambdaExpr ClonedReturnExpr
    let sum = {=> quote(a + b)}
    sum()

    // LambdaExpr
    let sum1 = {=> return quote(a + b)}
    sum1()

    // ParenExpr
    let b = (quote(4 + 5 + 6))

    // TernaryExpr UnaryExpr
    var c = if (!false) {
        quote(4 + 5 + 6)
    } else {
        quote(4 + 5 + 6)
    }

    // MatchExpr SelectorExpr MatchCase GuardExpr
    let ff: Tokens = match (quote(4 + 5 + 6)) {
        case a => quote(1 + 2 + 3)
        case b => quote(4 + 5 + 6)
        case c where true => quote(4 + 4 + 6)
        case _ => quote(5 + 6 + 7)
    }
    ff.dump()

    // WhileExpr
    while (true) {
        let b = (quote(4 + 5 + 6))
        break;
    }

    // DoWhileExpr
    do {
        let b = (quote(4 + 5 + 6))
        break;
    } while (true)

    // ReturnExpr
    return quote($expr)
}
