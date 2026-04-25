/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package m

import std.ast.*

public macro M(input: Tokens): Tokens {
    if (let fn: FuncDecl <- parseDecl(input)) {
        fn.funcParams.add(FuncParam(quote(x: String)))
        fn.block.nodes.add(parseExpr(quote(println("x + 1: ${x}"))), at: 0)
        fn.toTokens()
    } else {
        input
    }
}
