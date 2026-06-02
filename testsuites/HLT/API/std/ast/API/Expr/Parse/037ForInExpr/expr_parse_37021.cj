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
        for (i in while (a) {c} where while (a) {c}){
           while (a) {c}
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
        var InExprWhilecond = match (InExpr as WhileExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not WhileExpr")
        }
        var InExprWhilecondValue = match (InExprWhilecond as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var patternGuardWhilebody = match (patternGuard as WhileExpr) {
            case Some(v) => v.block
            case None => throw Exception("Not WhileExpr")
        }
        var patternGuardWhilebodyExpr = match (patternGuardWhilebody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var patternGuardWhilebodyExprValue = match (patternGuardWhilebodyExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var bodycond = match (body as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodycondExpr = match (bodycond as WhileExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not WhileExpr")
        }
        var bodycondExprValue = match (bodycondExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (pattrenExprValue != "i" || InExprWhilecondValue != "a" || patternGuardWhilebodyExprValue != "c" ||
            bodycondExprValue != "a") {
            return 1
        }
        return 0
    }
    return 1
}
