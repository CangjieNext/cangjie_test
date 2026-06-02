// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package component2

internal import std.ast.*
internal import std.collection.*

public macro Component(input: Tokens): Tokens {
    var classDecl: ClassDecl = (parseDecl(input) as ClassDecl).getOrThrow()
    var className: Token = classDecl.identifier
    let classModifier = classDecl.modifiers
    var classBody = classDecl.body.decls
    let declSize = classBody.size
    var varDecls = ArrayList<Decl>()
    var otherDecls = ArrayList<Decl>()
    for (i in 0..classBody.size) {
        if ((classBody[i] is VarDecl)) {
            varDecls.add(classBody[i])
        } else {
            otherDecls.add(classBody[i])
        }
    }

    let stateName: Token = Token(TokenKind.IDENTIFIER, className.value + "State")

    return quote(
        struct $(stateName) {
            $(varDecls)
        }

        $(classModifier) class $(className) {
            var state = $(stateName)()
            $(otherDecls)
        }
    )
}
