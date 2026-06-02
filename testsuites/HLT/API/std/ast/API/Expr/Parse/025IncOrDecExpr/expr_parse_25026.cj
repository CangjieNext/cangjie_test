/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ParseASTException
// ASSERT: scan parsing expr error

import std.ast.*

main(): Int64 {
    var input: Tokens = quote([a,b]--)
    let expr = parseExpr(input)
    /*
    if (expr.isIncOrDecExpr()) {
        var b = expr.asIncOrDecExpr()
        if (b.getExpr().asArrayLit().getChildren()[0].asRefExpr().getIdentifier().value != "a") {
            return 2
        }
        if (b.getOperatorKind() != TokenKind.DECR) {
            return 3
        }
        return 0
    }
     */
    if (expr is IncOrDecExpr) {
        var b = match (expr as IncOrDecExpr) {
            case Some(v) => v
            case None => throw Exception("Not IncOrDecExpr")
        }
        var aExpr = match (b.expr as ArrayLiteral) {
            case Some(v) => v.elements
            case None => throw Exception("Not ArrayLiteral")
        }
        var aValue = match (aExpr[0] as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (aValue != "a") {
            return 1
        }

        var opValue = b.op.value
        if (opValue != "--") {
            return 2
        }
        return 0
    }
    return 4
}
