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
    try {
        let asExpr1 = AsExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote()
    try {
        let asExpr2 = AsExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens3 = quote(
        Derive as Base
    )
    try {
        let asExpr3 = AsExpr(tokens3)
        asExpr3.keyword.dump()
        let asExpr33 = AsExpr(tokens3.append(tokens2))
        asExpr3.shiftType = asExpr33.shiftType
        asExpr3.keyword = Token()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}

/*SCAN-IN
expected expression after '', found '<EOF>'
*/
/*SCAN-IN
description: as, token_id: 58, token_literal_value: as
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be AS
*/
// ASSERT: scan cnt = 2