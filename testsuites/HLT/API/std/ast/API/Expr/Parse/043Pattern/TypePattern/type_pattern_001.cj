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
            case a: A => b
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
        var tpExpr = match (tp as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (!(pattern is TypePattern) || patternTypeRxpr != "a" || tpExpr != "A") {
            return 6
        }
        return 0
    }
    return 1
}
