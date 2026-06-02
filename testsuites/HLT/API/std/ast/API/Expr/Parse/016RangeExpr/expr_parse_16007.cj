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
    var input: Tokens = quote((a)..(b):(1))
    let expr = parseExpr(input)
    if (expr is RangeExpr) {
        var b = match (expr as RangeExpr) {
            case Some(v) => v
            case None => throw Exception("Not RangeExpr")
        }
        var startExpr = match (b.start as ParenExpr) {
            case Some(v) => v.parenthesizedExpr
            case None => throw Exception("Not ParenExpr")
        }

        var aValue = match (startExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var endExpr = match (b.end as ParenExpr) {
            case Some(v) => v.parenthesizedExpr
            case None => throw Exception("Not ParenExpr")
        }

        var dValue = match (endExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var stepExpr = match (b.step as ParenExpr) {
            case Some(v) => v.parenthesizedExpr
            case None => throw Exception("Not ParenExpr")
        }

        var eValue = match (stepExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        if (aValue != "a" || dValue != "b" || eValue != "1") {
            return 1
        }
        return 0
    }
    return 5
}
