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
            case Day(a, a, day(1), _, (_, 1)) | Hour(a, a, day(1), _, (_, 1)) where (true) => b
         }
    )
    let expr = parseExpr(input)
    if (expr is MatchExpr) {
        var mh = match (expr as MatchExpr) {
            case Some(v) => v
            case None => throw Exception("Not MatchExpr")
        }
        var patterns = match (mh.matchCases[0] as MatchCase) {
            case Some(v) => v.patterns
            case None => throw Exception("Not MatchCase")
        }
        var enum0 = match (patterns[0] as EnumPattern) {
            case Some(v) => v.constructor
            case None => throw Exception("Not EnumPattern")
        }
        var enum0Expr = match (enum0 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var enum1 = match (patterns[1] as EnumPattern) {
            case Some(v) => v.constructor
            case None => throw Exception("Not EnumPattern")
        }
        var enum1Expr = match (enum1 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var pattern1 = match (patterns[0] as EnumPattern) {
            case Some(v) => v
            case None => throw Exception("Not EnumPattern")
        }
        var pattern10 = pattern1.patterns[0]
        var pattern11 = pattern1.patterns[1]
        var pattern12 = pattern1.patterns[2]
        var pattern13 = pattern1.patterns[3]
        var pattern14 = pattern1.patterns[4]
        var pattern10Expr = match (pattern10 as VarOrEnumPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarOrEnumPattern")
        }
        var pattern11Expr = match (pattern11 as VarOrEnumPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarOrEnumPattern")
        }
        var pattern12Expr = match (pattern12 as EnumPattern) {
            case Some(v) => v.constructor
            case None => throw Exception("Not EnumPattern")
        }
        var pattern12ExprValue = match (pattern12Expr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var pattern14Expr = match (pattern14 as TuplePattern) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not TuplePattern")
        }

        var pattern2 = match (patterns[1] as EnumPattern) {
            case Some(v) => v
            case None => throw Exception("Not EnumPattern")
        }
        var pattern20 = pattern2.patterns[0]
        var pattern21 = pattern2.patterns[1]
        var pattern22 = pattern2.patterns[2]
        var pattern23 = pattern2.patterns[3]
        var pattern24 = pattern2.patterns[4]
        var pattern20Expr = match (pattern20 as VarOrEnumPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarOrEnumPattern")
        }
        var pattern21Expr = match (pattern21 as VarOrEnumPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarOrEnumPattern")
        }
        var pattern22Expr = match (pattern22 as EnumPattern) {
            case Some(v) => v.constructor
            case None => throw Exception("Not EnumPattern")
        }
        var pattern22ExprValue = match (pattern22Expr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var pattern24Expr = match (pattern24 as TuplePattern) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not TuplePattern")
        }

        if (patterns.size != 2 || enum0Expr != "Day" || enum1Expr != "Hour" || pattern10Expr != "a" || pattern11Expr !=
            "a" || pattern12ExprValue != "day" || !(pattern13 is WildcardPattern) || !(pattern14Expr is WildcardPattern) ||
            pattern20Expr != "a" || pattern21Expr != "a" || pattern22ExprValue != "day" ||
            !(pattern23 is WildcardPattern) || !(pattern24Expr is WildcardPattern)) {
            return 2
        }
        return 0
    }
    return 1
}
