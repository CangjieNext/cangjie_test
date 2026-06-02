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
    var input: Tokens = quote(while (a as Bool){b as Bool})
    let expr = parseExpr(input)
    if (expr is WhileExpr) {
        var whileExpr = match (expr as WhileExpr) {
            case Some(v) => v
            case None => throw Exception("Not WhileExpr")
        }
        var whileExprcondition = whileExpr.condition
        var whileExprconditionleft = match (whileExprcondition as AsExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not AsExpr")
        }
        var whileExprconditionleftExpr = match (whileExprconditionleft as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var whileExprconditionright = match (whileExprcondition as AsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not AsExpr")
        }
        var whileExprconditionrightExpr = match (whileExprconditionright as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        var whileExprblock = whileExpr.block
        var whileExprblockExpr = match (whileExprblock as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var whileExprblockleft = match (whileExprblockExpr as AsExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not AsExpr")
        }
        var whileExprblockleftExpr = match (whileExprblockleft as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var whileExprblockExprright = match (whileExprblockExpr as AsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not AsExpr")
        }
        var whileExprblockExprrightExpr = match (whileExprblockExprright as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (whileExprconditionleftExpr != "a" || whileExprconditionrightExpr != "Bool" || whileExprblockleftExpr != "b" ||
            whileExprblockExprrightExpr != "Bool") {
            return 1
        }
        return 0
    }
    return 10
}
