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
    let tokens1 = quote(
        a.b<>
    )
    try {
        let memberAccess1 = MemberAccess(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        a..b
    )
    try {
        let memberAccess2 = MemberAccess(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let memberAccess3 = MemberAccess()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let memberAccess4 = MemberAccess(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let memberAccess5 = MemberAccess(quote(A.a))
        memberAccess5.dot.dump()
        memberAccess5.dot = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let memberAccess6 = MemberAccess(quote(A.a))
        memberAccess6.lAngle.dump()
        memberAccess6.lAngle = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let memberAccess7 = MemberAccess(quote(A.a))
        memberAccess7.rAngle.dump()
        memberAccess7.rAngle = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let memberAccess8 = MemberAccess(quote(A.a))
        let memberAccess88 = MemberAccess(quote(B.b))
        memberAccess8.typeArguments = memberAccess88.typeArguments
        println(memberAccess8.typeArguments.size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let memberAccess9 = MemberAccess(quote(A.a))
        memberAccess9.commas = Tokens()
        println(memberAccess9.commas.size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let memberAccess9 = MemberAccess(quote(A.a))
        memberAccess9.field = Token(AND)
        memberAccess9.field.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/*SCAN-IN
expected type argument
*/
// ASSERT: scan ASTException: Cannot construct the 'MemberAccess' node
/*SCAN-IN
expected expression after '', found '<EOF>'
*/
/*SCAN-IN
description: dot, token_id: 0, token_literal_value: .
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be DOT
*/
/*SCAN-IN
description: illegal, token_id: 162, token_literal_value:
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be LT
*/
/*SCAN-IN
description: illegal, token_id: 162, token_literal_value:
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be GT
*/
// ASSERT: scan 0
// ASSERT: scan 0
/*SCAN-IN
description: and, token_id: 16, token_literal_value: &&
*/
// ASSERT: scan cnt = 6