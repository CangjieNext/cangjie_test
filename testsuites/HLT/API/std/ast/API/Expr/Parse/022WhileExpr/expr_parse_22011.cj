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
    var input: Tokens = quote(while (A()){b()})
    let expr = parseExpr(input)
    if (expr is WhileExpr) {
        var whileExpr = match (expr as WhileExpr) {
            case Some(v) => v
            case None => throw Exception("Not WhileExpr")
        }
        var whileExprcondition = whileExpr.condition
        var whileExprconditionunary = match (whileExprcondition as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var whileExprconditionunaryExpr = match (whileExprconditionunary as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var whileExprblock = whileExpr.block
        var whileExprblockExpr = match (whileExprblock as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var whileExprblockunary = match (whileExprblockExpr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var whileExprblockExprValue = match (whileExprblockunary as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (whileExprconditionunaryExpr != "A" || whileExprblockExprValue != "b") {
            return 1
        }
        return 0
    }
    return 10
}
