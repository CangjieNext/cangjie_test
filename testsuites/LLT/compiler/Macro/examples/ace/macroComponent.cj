// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package pkg1

internal import std.ast.*
internal import std.fs.*

public macro Component(input: Tokens): Tokens {
    // Read names from a file
    var macroName: String = "State"

    var varName: String = String.fromUtf8(File.readFrom("doc.txt"))

    var decl = parseDecl(input)
    var structDecl = (decl as StructDecl).getOrThrow()
    var structBody = structDecl.body.decls
    var testTokens = quote($structBody)

    // collect all uninitialized varDecl
    // store their identifiers in toInit array
    var varDecls = structDecl.body.decls
    var declsSize = varDecls.size
    var toInit = Array<String>(declsSize, {i => ""})
    var k = 0
    for (i in 0..declsSize) {
        // find uninitialized varDecl
        try {
            if (varDecls[i] is VarDecl) {
                (varDecls[i] as VarDecl).getOrThrow().expr
            }
        } catch (e: Exception) {
            toInit[k] = varDecls[i].identifier.value
            k++
        }
    }

    var ident = structDecl.identifier
    var ret1 = quote(struct $ident {)
    var ret2 = quote(var start = 1)
    var ret3 = quote($structBody)
    var ret4 = quote(
  var end = 2
  func getDelt() {end - start}
  )
    var ret5 = Token(TokenKind.NL)
    // initialization
    // init params
    var initParams: Tokens = quote(\()
    for (i in 0..k) {
        var paramIdent = Token(ident.kind, toInit[i] + "_")
        initParams = initParams + paramIdent + quote(: Int64)
        if (i < k - 1) {
            initParams = initParams + quote(, )
        }
    }
    initParams = initParams + quote(\))

    // init body
    var initBody: Tokens = quote({)
    for (i in 0..k) {
        var toInitName = toInit[i]
        var bodyDecl: Tokens
        // quote(;) create newlines
        if (toInitName == varName) {
            bodyDecl = quote(this.) + Token(ident.kind, toInit[i]) + quote(=) + quote(42) + quote(;)
        } else {
            bodyDecl = quote(this.) + Token(ident.kind, toInit[i]) + quote(=) + Token(ident.kind, toInit[i] + "_") +
                quote(;)
        }
        initBody = initBody + bodyDecl
    }
    initBody = initBody + quote(})

    // init
    var ret7 = quote(init) + initParams + initBody

    var ret = ret1 + ret2 + ret3 + ret4 + ret5 + ret7 + quote(})
    return ret
}
