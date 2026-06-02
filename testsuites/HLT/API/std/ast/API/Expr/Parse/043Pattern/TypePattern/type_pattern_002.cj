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
         match (a) {
            case a:((M7_<I1_>)->G1_)->((G2_,G3_)) where (true) => b
         }
    )
    let expr = parseExpr(input)
    if (expr is MatchExpr) {
        var mh = match (expr as MatchExpr) {
            case Some(v) => v
            case None => throw Exception("Not MatchExpr")
        }
        var pattern = match (mh.matchCases[0] as MatchCase) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not MatchCase")
        }
        var patternType = match (pattern as TypePattern) {
            case Some(v) => v.pattern
            case None => throw Exception("Not TypePattern")
        }
        var patternTypeRxpr = match (patternType as VarPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarPattern")
        }
        var tp = match (pattern as TypePattern) {
            case Some(v) => v.patternType
            case None => throw Exception("Not TypePattern")
        }
        var tpExpr = match (tp as FuncType) {
            case Some(v) => v.types[0]
            case None => throw Exception("Not FuncType")
        }
        var tpExpr2 = match (tpExpr as FuncType) {
            case Some(v) => v.types[0]
            case None => throw Exception("Not FuncType")
        }
        var tpExpr2Expr = match (tpExpr2 as RefType) {
            case Some(v) => v.typeArguments[0]
            case None => throw Exception("Not RefType")
        }
        var tpExpr2ExprValue = match (tpExpr2Expr as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (!(pattern is TypePattern) || patternTypeRxpr != "a" || tpExpr2ExprValue != "I1_") {
            return 1
        }
        return 0
    }
    return 1
}
