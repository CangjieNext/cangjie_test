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
    var input: Tokens = quote(a=0..10:1)
    let expr = parseExpr(input)
    if (expr is AssignExpr) {
        var assignExpr = match (expr as AssignExpr) {
            case Some(v) => v
            case None => throw Exception("Not AssignExpr")
        }
        var lExpr = assignExpr.leftExpr
        var rExpr = assignExpr.rightExpr
        var optValue = assignExpr.assign.value
        var lExprValue = match (lExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var rangeExprStart = match (rExpr as RangeExpr) {
            case Some(v) => v.start
            case None => throw Exception("Not RangeExpr")
        }
        var rangeExprStartValue = match (rangeExprStart as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var rangeExprEnd = match (rExpr as RangeExpr) {
            case Some(v) => v.end
            case None => throw Exception("Not RangeExpr")
        }
        var rangeExprEndValue = match (rangeExprEnd as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var rangeExprStep = match (rExpr as RangeExpr) {
            case Some(v) => v.step
            case None => throw Exception("Not RangeExpr")
        }
        var rangeExprStepValue = match (rangeExprStep as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var rangeExprOp = match (rExpr as RangeExpr) {
            case Some(v) => v.op.value
            case None => throw Exception("Not RangeExpr")
        }
        var rangeExprColon = match (rExpr as RangeExpr) {
            case Some(v) => v.colon.value
            case None => throw Exception("Not RangeExpr")
        }
        if (lExprValue != "a" || rangeExprStartValue != "0" || rangeExprEndValue != "10" || rangeExprStepValue != "1" ||
            optValue != "=" || rangeExprOp != ".." || rangeExprColon != ":") {
            return 1
        }
        return 0
    }
    return 3
}
