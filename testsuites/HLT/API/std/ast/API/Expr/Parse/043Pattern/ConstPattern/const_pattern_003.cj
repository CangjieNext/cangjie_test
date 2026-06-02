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
            case 10 | 30 | "hi" where (true) => b
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
        var pattern2 = pattern.patterns[2]
        var pattern0Const = match (pattern0 as ConstPattern) {
            case Some(v) => v.litConstExpr
            case None => throw Exception("Not ConstPattern")
        }
        var pattern0ConstValue = match (pattern0Const as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var pattern1Const = match (pattern1 as ConstPattern) {
            case Some(v) => v.litConstExpr
            case None => throw Exception("Not ConstPattern")
        }
        var pattern1ConstValue = match (pattern1Const as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var pattern2Const = match (pattern2 as ConstPattern) {
            case Some(v) => v.litConstExpr
            case None => throw Exception("Not ConstPattern")
        }
        var pattern2ConstValue = match (pattern2Const as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (!(pattern0 is ConstPattern) || pattern0ConstValue != "10" || pattern1ConstValue != "30" ||
            pattern2ConstValue != "hi") {
            return 1
        }
        return 0
    }
    return 1
}
