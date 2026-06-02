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

main() {
    var input: Tokens = quote(
        for (i in do {b} while(d) where do {b} while(d)){
            do {b} while(d)
        }
    )
    let expr = parseExpr(input)
    if (expr is ForInExpr) {
        var forExpr = match (expr as ForInExpr) {
            case Some(v) => v
            case None => throw Exception("Not ForInExpr")
        }
        var pattrenExpr = forExpr.pattern
        var InExpr = forExpr.expr
        var body = forExpr.block
        var patternGuard = forExpr.patternGuard
        var pattrenExprValue = match (pattrenExpr as VarPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarPattern")
        }
        var InExprDoWhile = match (InExpr as DoWhileExpr) {
            case Some(v) => v.block
            case None => throw Exception("Not DoWhileExpr")
        }
        var InExprDoWhileExpr = match (InExprDoWhile as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var InExprDoWhileExprValue = match (InExprDoWhileExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var patternGuardDoWhilecond = match (patternGuard as DoWhileExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not DoWhileExpr")
        }
        var patternGuardDoWhilecondValue = match (patternGuardDoWhilecond as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var bodyblock = match (body as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodyblockbody = match (bodyblock as DoWhileExpr) {
            case Some(v) => v.block
            case None => throw Exception("Not DoWhileExpr")
        }
        var bodyblockbodyExpr = match (bodyblockbody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodyblockbodyExprValue = match (bodyblockbodyExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (pattrenExprValue != "i" || InExprDoWhileExprValue != "b" || patternGuardDoWhilecondValue != "d" ||
            bodyblockbodyExprValue != "b") {
            return 1
        }
        return 0
    }
    return 1
}
