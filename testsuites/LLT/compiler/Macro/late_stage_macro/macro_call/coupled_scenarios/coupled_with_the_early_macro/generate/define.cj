// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import stdx.syntax.*

public late macro LateM(input: Decl): Decl {
    return input
}

public macro M(input: Tokens): Tokens {
    return input
}

public late macro LateGenLate(input: Decl): Decl {
    return @LateM input
}

public late macro LateGenEarly(input: Decl): Decl {
    let tks = @M quote(input)
    let node = parseTokens(@M tks).node.getOrThrow()
    return (node as Decl).getOrThrow()
}

public macro EarlyGenLate(input: Tokens): Tokens {
    let node = parseTokens(input).node.getOrThrow()
    let decl = (node as Decl).getOrThrow()
    return quote(
        @LateM
        decl
    )
}