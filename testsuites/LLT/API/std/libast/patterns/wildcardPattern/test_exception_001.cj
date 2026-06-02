// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote(for)
    try {
        let wildcard1 = WildcardPattern(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote()
    try {
        let wildcard2 = WildcardPattern(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let wildcard3 = WildcardPattern()
        wildcard3.wildcard = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let wildcard4 = WildcardPattern(quote(_))
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be WILDCARD
ASTException: Cannot construct the 'WildcardPattern' node. (Empty Input)
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
