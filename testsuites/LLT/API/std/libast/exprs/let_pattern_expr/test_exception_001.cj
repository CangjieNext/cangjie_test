/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args %noColor | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote(let a=1)
    try {
        let letPatternExpr1 = LetPatternExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(a++)
    try {
        let letPatternExpr2 = LetPatternExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let letPatternExpr3 = LetPatternExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let letPatternExpr4 = LetPatternExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let letPatternExpr5 = LetPatternExpr(quote(let Some(v) <- a))
        letPatternExpr5.keyword.dump()
        letPatternExpr5.keyword = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let letPatternExpr6 = LetPatternExpr(quote(let Some(v) <- a))
        let letPatternExpr66 = LetPatternExpr(quote(let Some(t) <- a))
        letPatternExpr6.pattern = letPatternExpr66.pattern
        letPatternExpr6.pattern.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let letPatternExpr7 = LetPatternExpr(quote(let Some(v) <- a))
        letPatternExpr7.backArrow.dump()
        letPatternExpr7.backArrow = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let letPatternExpr8 = LetPatternExpr(quote(let Some(v) <- a))
        let letPatternExpr88 = LetPatternExpr()
        letPatternExpr8.expr = letPatternExpr88.expr
        letPatternExpr8.expr.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/*SCAN-IN
expected '<-' in if-let expression, found '='
*/
// ASSERT: scan ASTException: Cannot construct the 'LetPatternExpr' node
/*SCAN-IN
expected expression after '', found '<EOF>'
*/
/*SCAN-IN
description: let, token_id: 91, token_literal_value: let
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be LET
*/
/*SCAN-IN
value: "Some"
*/
/*SCAN-IN
description: backarrow, token_id: 45, token_literal_value: <-
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be BACKARROW
*/
// ASSERT: scan cnt = 5