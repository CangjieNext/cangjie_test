/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main(): Int64 {
    var input: Tokens = quote(while (a){b;c;d})
    let expr = parseExpr(input)
    if (expr is WhileExpr) {
        var whileExpr = match (expr as WhileExpr) {
            case Some(v) => v
            case None => throw Exception("Not WhileExpr")
        }
        var whileExprcondition = whileExpr.condition
        var whileExprconditionExpr = match (whileExprcondition as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var whileExprblock = whileExpr.block
        var whileExprblockExpr = match (whileExprblock as Block) {
            case Some(v) => v.nodes[2]
            case None => throw Exception("Not Block")
        }
        var whileExprblockExprValue = match (whileExprblockExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (whileExprconditionExpr != "a" || whileExprblockExprValue != "d") {
            return 1
        }
        return 0
    }
    return 3
}
