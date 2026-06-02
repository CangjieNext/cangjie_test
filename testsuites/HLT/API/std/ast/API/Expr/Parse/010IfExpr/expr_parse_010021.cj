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
        if (false) {
            Int32(a)
        } else {
            Int64(b)
        }
    )
    let expr = parseExpr(input)
    if (expr is IfExpr) {
        var ifExpr = match (expr as IfExpr) {
            case Some(v) => v
            case None => throw Exception("Not Exception")
        }
        var condExpr = ifExpr.condition
        var ifBody = ifExpr.ifBlock
        var elseBody = ifExpr.elseExpr
        var condExprValue = match (condExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var ifBodyExpr = match (ifBody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var ifBodyTypeConvExpr = match (ifBodyExpr as TypeConvExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not TypeConvExpr")
        }
        var ifBodyTypeConvExprValue = match (ifBodyTypeConvExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var elseBodyExpr = match (elseBody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var elseBodyTypeConvExpr = match (elseBodyExpr as TypeConvExpr) {
            case Some(v) => v.targetType
            case None => throw Exception("Not TypeConvExpr")
        }
        var elseBodyPrimitiveType = match (elseBodyTypeConvExpr as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (condExprValue != "false" || ifBodyTypeConvExprValue != "a" || !(elseBodyTypeConvExpr is PrimitiveType) ||
            elseBodyPrimitiveType != "Int64") {
            return 1
        }
        return 0
    }
    return 4
}
