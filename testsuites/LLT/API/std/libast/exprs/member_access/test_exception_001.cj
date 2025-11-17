// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

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

/* SCAN-IN
ASTException: 
[31merror[0m: expected type argument
  [36m| [0m
  [36m| [0ma.b < >[0m
  [36m| [0m      [31m^ [0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'MemberAccess' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: dot, token_id: 0, token_literal_value: ., fileID: 1, line: 43, column: 49
ASTException: Illegal TokenKind, TokenKind should be DOT
description: illegal, token_id: 156, token_literal_value: , fileID: 0, line: 0, column: 0
ASTException: Illegal TokenKind, TokenKind should be LT
description: illegal, token_id: 156, token_literal_value: , fileID: 0, line: 0, column: 0
ASTException: Illegal TokenKind, TokenKind should be GT
0
0
description: and, token_id: 16, token_literal_value: &&, fileID: 1, line: 90, column: 31
cnt = 6
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
