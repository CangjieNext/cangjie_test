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
            case (a,b) where (true) => b
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
        var patternTuple0Expr = match (patternTuple0 as VarOrEnumPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarOrEnumPattern")
        }
        var patternTuple1Expr = match (patternTuple1 as VarOrEnumPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarOrEnumPattern")
        }
        if (!(pattern is TuplePattern) || patternTuple0Expr != "a" || patternTuple1Expr != "b") {
            return 1
        }
        return 0
    }
    return 1
}
