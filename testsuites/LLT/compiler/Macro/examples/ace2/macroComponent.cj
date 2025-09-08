// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package component

internal import std.ast.*

public macro Component(input: Tokens): Tokens {
    var decl = parseDecl(input)
    var structDecl = (decl as StructDecl).getOrThrow()

    var ident = structDecl.identifier
    var ret1 = quote(class $ident <: View {)

    var structBody = structDecl.body.decls
    var ret2 = quote($structBody)

    var varDecls = structBody
    var declsSize = varDecls.size

    for (i in 0..declsSize) {
        print("var: " + varDecls[i].identifier.value + "\n")
    }

    // init params
    var initParams: Tokens = quote(\()
    for (i in 0..declsSize) {
        var paramIdent = Token(ident.kind, "_" + varDecls[i].identifier.value)
        initParams = initParams + paramIdent + quote(: Int64)
        if (i < declsSize - 1) {
            initParams = initParams + quote(, )
        }
    }
    initParams = initParams + quote(\))

    // init body
    var initBody: Tokens = quote({)
    for (i in 0..declsSize) {
        var bodyDecl: Tokens
        var varName = varDecls[i].identifier.value

        if (varDecls[i].hasAttr("State")) {
            bodyDecl = quote(this.) + Token(ident.kind, "createState") + quote(\() + quote($varName) + quote(\)) + quote(;)
            initBody = initBody + bodyDecl
        }
        if (varDecls[i].hasAttr("Binding")) {
            bodyDecl = quote(this.) + Token(ident.kind, "createLink") + quote(\() + quote($varName) + quote(\)) + quote(;)
            initBody = initBody + bodyDecl
        }
    }
    initBody = initBody + quote(})

    // init
    var ret3 = quote(init) + initParams + initBody

    var ret = ret1 + ret2 + ret3 + quote(})
    return ret
}
