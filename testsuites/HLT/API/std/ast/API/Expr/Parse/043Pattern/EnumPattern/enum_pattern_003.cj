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
            case Day(a, a, day(1), _, (_, 1)) where (true) => b
         }
    )
    let expr = parseExpr(input)
    if (expr is MatchExpr) {
        var mh = match (expr as MatchExpr) {
            case Some(v) => v
            case None => throw Exception("Not MatchExpr")
        }
        var pattern_1 = match (mh.matchCases[0] as MatchCase) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not MatchCase")
        }
        var pattern = match (pattern_1 as EnumPattern) {
            case Some(v) => v
            case None => throw Exception("Not EnumPattern")
        }
        var DayExpr = pattern.constructor
        var DayExprValue = match (DayExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var pattern0 = pattern.patterns[0]
        var pattern1 = pattern.patterns[1]
        var pattern2 = pattern.patterns[2]
        var pattern3 = pattern.patterns[3]
        var pattern4 = pattern.patterns[4]
        var pattern0Expr = match (pattern0 as VarOrEnumPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarOrEnumPattern")
        }
        var pattern1Expr = match (pattern1 as VarOrEnumPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarOrEnumPattern")
        }
        var pattern2Expr = match (pattern2 as EnumPattern) {
            case Some(v) => v.constructor
            case None => throw Exception("Not EnumPattern")
        }
        var pattern2ExprValue = match (pattern2Expr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var pattern4Expr = match (pattern4 as TuplePattern) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not TuplePattern")
        }
        if (!(pattern_1 is EnumPattern) || DayExprValue != "Day" || pattern0Expr != "a" || pattern1Expr != "a" ||
            pattern2ExprValue != "day" || !(pattern3 is WildcardPattern) || !(pattern4Expr is WildcardPattern)) {
            return 1
        }
        return 0
    }
    return 1
}
