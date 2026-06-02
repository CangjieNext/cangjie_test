// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package view

internal import std.ast.*

public macro callView(input: Tokens): Tokens {
    input
}

public macro callView2(input: Tokens): Tokens {
    let token = cangjieLex("var c:Int64 = 3")
    token.dump()
    input
}

public macro callView3(input: Tokens): Tokens {
    quote(return 0)
}

public macro callView4(input: Tokens): Tokens {
    Tokens()
}

public macro callView5(input: Tokens): Tokens {
    var l = parseExpr(input)
    return quote($l)
}

public macro callView6(input: Tokens): Tokens {
    var s = (parseExpr(input) as SpawnExpr).getOrThrow()
    return quote($(s.lambdaExpr.nodes))
}

public macro X(attr: Tokens, input: Tokens) {
    return attr + quote(-) + input
}

public macro Y(attr: Tokens, input: Tokens) {
    return quote(1+1)
}

public macro M(input: Tokens) {
    input
}

public macro M(attr: Tokens, input: Tokens) {
    input
}
