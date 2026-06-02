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
            case Day(1) | Hour(2) where (true) => b
         }
    )
    let expr = parseExpr(input)
    if (expr is MatchExpr) {
        var mh = match (expr as MatchExpr) {
            case Some(v) => v
            case None => throw Exception("Not MatchExpr")
        }
        var pattern = match (mh.matchCases[0] as MatchCase) {
            case Some(v) => v
            case None => throw Exception("Not MatchCase")
        }
        var pattern0 = pattern.patterns[0]
        var pattern1 = pattern.patterns[1]
        var pattern0Enum = match (pattern0 as EnumPattern) {
            case Some(v) => v.constructor
            case None => throw Exception("Not EnumPattern")
        }
        var pattern0EnumExpr = match (pattern0Enum as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var pattern1Enum = match (pattern1 as EnumPattern) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not EnumPattern")
        }
        var pattern1EnumConst = match (pattern1Enum as ConstPattern) {
            case Some(v) => v.litConstExpr
            case None => throw Exception("Not ConstPattern")
        }
        var pattern1EnumConstValue = match (pattern1EnumConst as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (!(pattern0 is EnumPattern) || pattern0EnumExpr != "Day" || pattern1EnumConstValue != "2") {
            return 2
        }
        return 0
    }
    return 1
}
