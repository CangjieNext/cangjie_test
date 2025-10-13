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
    var input: Tokens = quote(a=Int64(x))
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
        var typeConvExpr = match (rExpr as TypeConvExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not TypeConvExpr")
        }
        var rExprValue = match (typeConvExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var typeConvExprType = match (rExpr as TypeConvExpr) {
            case Some(v) => v.targetType
            case None => throw Exception("Not TypeConvExpr")
        }
        // var typeConvExprTypeValue = match (typeConvExprType as LitConstExpr){
        // }
        var typeConvExprTypeValue = match (typeConvExprType as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (lExprValue != "a" || rExprValue != "x" || optValue != "=" || typeConvExprTypeValue != "Int64") {
            return 1
        }
        return 0
    }
    return 3
}
