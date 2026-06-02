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
            case (a, a, day(1), _, (_, 1)) where (true) => b
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
        var patternTuple = match (pattern as TuplePattern) {
            case Some(v) => v
            case None => throw Exception("Not TuplePattern")
        }
        var patternTuple0 = patternTuple.patterns[0]
        var patternTuple1 = patternTuple.patterns[1]
        var patternTuple2 = patternTuple.patterns[2]
        var patternTuple3 = patternTuple.patterns[3]
        var patternTuple4 = patternTuple.patterns[4]
        var patternTuple0Expr = match (patternTuple0 as VarOrEnumPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarOrEnumPattern")
        }
        var patternTuple1Expr = match (patternTuple1 as VarOrEnumPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarOrEnumPattern")
        }
        var patternTuple2Expr = match (patternTuple2 as EnumPattern) {
            case Some(v) => v.constructor
            case None => throw Exception("Not EnumPattern")
        }
        var patternTuple2ExprValue = match (patternTuple2Expr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var patternTuple4Expr = match (patternTuple4 as TuplePattern) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not TuplePattern")
        }
        if (!(pattern is TuplePattern) || patternTuple0Expr != "a" || patternTuple1Expr != "a" ||
            patternTuple2ExprValue != "day" || !(patternTuple3 is WildcardPattern) ||
            !(patternTuple4Expr is WildcardPattern)) {
            return 1
        }
        return 0
    }
    return 1
}
