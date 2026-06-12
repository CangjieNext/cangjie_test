/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %enableEH %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %set_stdx_path %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        resume with 42
    )
    try {
        let resumeExpr1 = ResumeExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        a++
    )
    try {
        let resumeExpr2 = ResumeExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let resumeExpr3 = ResumeExpr()
        var resumeExpr33 = ResumeExpr(tokens1)
        resumeExpr3.withExpr = resumeExpr33.withExpr
        resumeExpr3.withExpr.getOrThrow().dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens4 = quote(
        resume with 42
    )
    try {
        var resumeExpr4 = ResumeExpr(tokens4)
        resumeExpr4.keywordR.dump()
        resumeExpr4.keywordR = Token()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        ResumeExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}

/* SCAN-IN
ASTException: Cannot construct the 'ResumeExpr' node.
LitConstExpr {
  -literal: Token {
    value: "42"
    kind: INTEGER_LITERAL
    pos: 17: 21
  }
}
description: resume, token_id: 159, token_literal_value: resume, fileID: 1, line: 47, column: 9
ASTException: Illegal TokenKind, TokenKind should be RESUME
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
cnt = 3
 */
