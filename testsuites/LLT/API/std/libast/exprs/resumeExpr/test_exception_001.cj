/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// EXEC: %compiler %enableEH %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %set_stdx_path %run_opt %output %run_args %noColor | compare %f

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

// ASSERT: scan ASTException: Cannot construct the 'ResumeExpr' node
/*SCAN-IN
value: "42"
*/
/*SCAN-IN
description: resume, token_id: 159, token_literal_value: resume
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be RESUME
*/
/*SCAN-IN
expected expression after '', found '<EOF>'
*/
// ASSERT: scan cnt = 3