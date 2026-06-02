// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package pkg2

internal import std.ast.*
internal import std.fs.*

public macro State(input: Tokens): Tokens {
    // input is varDecl: var cnt = 0
    var decl = parseDecl(input)
    var varDecl = (decl as VarDecl).getOrThrow()
    var identTok: Token = varDecl.identifier // ident should be modified, foo -> foo_, how?
    var identTok_: Token = Token(identTok.kind, identTok.value + "_")
    var identAfter: Tokens = quote(var $identTok_ : Int64) // var cnt_ : Int64 = 1
    var genTokens1: Tokens = quote(var cnt1 = 3)
    var genTokens2: Tokens = quote(func getCnt1() { cnt1 })
    var genStateTokens: Tokens = genTokens1 + genTokens2
    var ret: Tokens = identAfter + genStateTokens

    // Write the var name into a file, so other macros can access them
    var toWrite: String = identTok_.value
    var fs = File("doc.txt", ReadWrite)
    fs.write(toWrite.toArray())
    fs.close()

    return ret
}
