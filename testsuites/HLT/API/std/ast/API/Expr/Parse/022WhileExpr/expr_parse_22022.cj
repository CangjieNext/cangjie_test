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

// main(): Int64 {
//     var input : Tokens = quote(while (do {b} while (a)){do {c} while (false)})
//     let expr = parseExpr(input)
//     if (expr.isWhileExpr()) {
//         var b = expr.asWhileExpr()
//         if (b.getCondExpr().asDoWhileExpr().getCondExpr().asRefExpr().getIdentifier().value != "a") {
//             return 1
//         }
//         if (b.getBody()[0].asExpr().asDoWhileExpr().getBody()[0].asExpr().asRefExpr().getIdentifier().value != "c") {
//             return 3
//         }
//         return 0
//     }
//     return 10
// }

main(): Int64 {
    var input: Tokens = quote(while (do {b} while (a)){do {c} while (false)})
    let expr = parseExpr(input)
    if (expr is WhileExpr) {
        var whileExpr = match (expr as WhileExpr) {
            case Some(v) => v
            case None => throw Exception("Not WhileExpr")
        }
        var whileExprcondition = whileExpr.condition
        var whileExprconditionDoWhileExpr = match (whileExprcondition as DoWhileExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not DoWhileExpr")
        }
        var whileExprconditionDoWhileExprValue = match (whileExprconditionDoWhileExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var whileExprblock = whileExpr.block
        var whileExprblockExpr = match (whileExprblock as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var whileExprblockDoWhile = match (whileExprblockExpr as DoWhileExpr) {
            case Some(v) => v.block
            case None => throw Exception("Not DoWhileExpr")
        }
        var whileExprblockDoWhileExpr = match (whileExprblockDoWhile as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var whileExprblockDoWhileExprValue = match (whileExprblockDoWhileExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (whileExprconditionDoWhileExprValue != "a" || whileExprblockDoWhileExprValue != "c") {
            return 1
        }
        return 0
    }
    return 10
}
