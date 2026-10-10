/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

import std.ast.*
import std.collection.*

main(): Int64 {
    var cnt = 0

    try {
        let matchCase = MatchCase()
        matchCase.keywordC = Token(CASE)
        matchCase.keywordC.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let matchCase = MatchCase()
        matchCase.expr = BinaryExpr()
        matchCase.expr.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let matchCase = MatchCase()
        let tuplePattern = TuplePattern()
        matchCase.patterns = ArrayList<Pattern>.of(tuplePattern)
        println(matchCase.patterns.size)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let matchCase = MatchCase()
        matchCase.patterns = ArrayList<Pattern>([TuplePattern(), ConstPattern()])
        matchCase.bitOrs = Tokens().append(Token(BITOR))
        println(matchCase.bitOrs)
        println(matchCase.toTokens())
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let matchCase = MatchCase()
        matchCase.keywordW = Token(WHERE)
        matchCase.keywordW.dump()
        println(matchCase.toTokens())
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let matchCase = MatchCase()
        matchCase.patternGuard = BinaryExpr()
        matchCase.patternGuard.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let matchCase = MatchCase()
        matchCase.arrow = Token(DOUBLE_ARROW)
        matchCase.arrow.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let matchCase = MatchCase()
        matchCase.block = Block()
        matchCase.block.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

// ASSERT: scan description: case, token_id: 100, token_literal_value: case
// ASSERT: scan BinaryExpr {
// ASSERT: scan -leftExpr:   -rightExpr: }
// ASSERT: scan 1
// ASSERT: scan |
// ASSERT: scan case() | =>
// ASSERT: scan description: where, token_id: 114, token_literal_value: where
// ASSERT: scan case
// ASSERT: scan BinaryExpr {
// ASSERT: scan -leftExpr:   -rightExpr: }
// ASSERT: scan description: double_arrow, token_id: 46, token_literal_value: =>
// ASSERT: scan Block {
// ASSERT: scan cnt = 0