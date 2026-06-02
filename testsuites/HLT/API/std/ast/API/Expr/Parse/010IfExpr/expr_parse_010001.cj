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
    var input: Tokens = quote(if (true) {a} else{1})
    let expr = parseExpr(input)
    if (expr is IfExpr) {
        var isExpr = match (expr as IfExpr) {
            case Some(v) => v
            case None => throw Exception("Not IfExpr")
        }
        var ifExpr = isExpr.keywordI.value
        var condExpr = isExpr.condition
        var ifBody = isExpr.ifBlock
        var elseExpr = isExpr.keywordE.value
        var elseBody = isExpr.elseExpr

        var condExprValue = match (condExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var ifBodyExpr = match (ifBody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var ifBodyExprValue = match (ifBodyExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var elseBodyExpr = match (elseBody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var elseBodyExprValue = match (elseBodyExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (ifExpr != "if" || condExprValue != "true" || ifBodyExprValue != "a" || elseExpr != "else" ||
            elseBodyExprValue != "1") {
            return 1
        }
        return 0
    }
    return 2
}
