macro package define

import std.ast.*

public macro M(input: Tokens): Tokens {
    let tks = cangjieLex("var a = (1")
    tks.append(quote(+1\)))
    tks.dump()
    let varDecl = (parseDecl(tks) as VarDecl).getOrThrow()
    varDecl.toTokens()
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
