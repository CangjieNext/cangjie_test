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
         for ((x, y) in list where c) {}
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
        var pattrenExprTuple = match (pattrenExpr as TuplePattern) {
            case Some(v) => v
            case None => throw Exception("Not TuplePattern")
        }
        var pattrenExprTuple0 = pattrenExprTuple.patterns[0]
        var pattrenExprTuple0Expr = match (pattrenExprTuple0 as VarPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var pattrenExprTuple1 = pattrenExprTuple.patterns[1]
        var pattrenExprTuple1Expr = match (pattrenExprTuple1 as VarPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var InExprValue = match (InExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var patternGuardValue = match (patternGuard as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var bodySize = match (body as Block) {
            case Some(v) => v.nodes.size
            case None => throw Exception("Not Block")
        }
        if (!(pattrenExpr is TuplePattern) || pattrenExprTuple0Expr != "x" || pattrenExprTuple1Expr != "y" ||
            InExprValue != "list" || patternGuardValue != "c" || bodySize != 0) {
            return 1
        }
        return 0
    }
    return 1
}
