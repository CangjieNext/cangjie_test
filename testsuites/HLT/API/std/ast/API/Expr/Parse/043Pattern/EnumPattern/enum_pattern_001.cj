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
            case Day(1) where (true) => b
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
        var patternEnum = match (pattern as EnumPattern) {
            case Some(v) => v
            case None => throw Exception("Not EnumPattern")
        }
        var patternEnumEcon = patternEnum.constructor
        var patternEnumEpat = patternEnum.patterns[0]
        var patternEnumEconValue = match (patternEnumEcon as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var patternEnumEpatExpr = match (patternEnumEpat as ConstPattern) {
            case Some(v) => v.litConstExpr
            case None => throw Exception("Not ConstPattern")
        }
        var patternEnumEpatExprValue = match (patternEnumEpatExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (!(pattern is EnumPattern) || patternEnumEconValue != "Day" || patternEnumEpatExprValue != "1") {
            return 1
        }
        return 0
    }
    return 1
}
