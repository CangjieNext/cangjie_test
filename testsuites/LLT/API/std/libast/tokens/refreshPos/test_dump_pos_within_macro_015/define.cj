/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
macro package s1

import std.ast.*

public macro Call1(input: Tokens): Tokens {
    let classDecl = ClassDecl(input)
    let varDecl = parseDecl(quote(let namespace: String = @sourcePackage()))
    varDecl.toTokens().dump()
    classDecl.body.decls.add(varDecl)
    return classDecl.toTokens()
}
