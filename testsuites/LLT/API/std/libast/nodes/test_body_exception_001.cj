// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

import std.ast.*
import std.collection.*

main(): Int64 {
    var cnt = 0

    try {
        let body = Body(ArrayList<Decl>.of(EnumDecl()))
        println(body.decls.size)
        body.decls = ArrayList<Decl>()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let body = Body(ArrayList<Decl>.of(EnumDecl()))
        body.lBrace.dump()
        body.lBrace = Token(SENTINEL)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let body = Body(ArrayList<Decl>.of(EnumDecl()))
        body.rBrace.dump()
        body.rBrace = Token(SENTINEL)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN
1
description: l_curl, token_id: 6, token_literal_value: {, fileID: 10, line: 449, column: 34
Illegal TokenKind, TokenKind should be LCURL
description: r_curl, token_id: 7, token_literal_value: }, fileID: 10, line: 451, column: 34
Illegal TokenKind, TokenKind should be RCURL
cnt = 2
*/

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */