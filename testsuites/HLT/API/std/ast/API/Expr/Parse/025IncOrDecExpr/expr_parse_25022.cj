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
    var input: Tokens = quote(break++)
    let expr = parseExpr(input)
    /*
    if (expr.isIncOrDecExpr()) {
        var b = expr.asIncOrDecExpr()
        if (!b.getExpr().asJumpExpr().isBreak()) {
            return 2
        }
        if (b.getOperatorKind() != TokenKind.INCR) {
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
        var aValue = match (b.expr as JumpExpr) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not JumpExpr")
        }
        if (aValue != "break") {
            return 1
        }

        var opValue = b.op.value
        if (opValue != "++") {
            return 2
        }
        return 0
    }
    return 4
}
