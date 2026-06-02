// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote(for)
    try {
        let varOrEnum1 = VarOrEnumPattern(tokens1[0])
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let varOrEnum2 = VarOrEnumPattern()
        varOrEnum2.identifier = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be IDENTIFIER
ASTException: Illegal TokenKind, TokenKind should be IDENTIFIER
cnt = 2
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
