/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
macro package s2

import std.ast.*
import s1.*

public macro Call2(input: Tokens): Tokens {
    let classDecl = ClassDecl(input)
    let tk = quote(@Call1())
    let varDecl = parseDecl(tk)
    println("-------position in Call2-------")
    varDecl.toTokens().dump()
    classDecl.body.decls.add(varDecl)
    return classDecl.toTokens()
}
