// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        _
    )
    try {
        let wildcardExpr1 = WildcardExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote()
    try {
        let wildcardExpr2 = WildcardExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let wildcardExpr3 = WildcardExpr()
        wildcardExpr3.keyword = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let wildcardExpr4 = WildcardExpr(quote(_))
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be WILDCARD
ASTException: Cannot construct the 'WildcardExpr' node. (Empty Input)
ASTException: Illegal TokenKind, TokenKind should be WILDCARD
cnt = 3
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
