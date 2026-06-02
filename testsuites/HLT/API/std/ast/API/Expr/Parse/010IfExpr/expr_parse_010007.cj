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
    var input: Tokens = quote(if(a){1}else {2})
    let expr = parseExpr(input)
    var ifExpr = match (expr as IfExpr) {
        case Some(v) => v
        case None => throw Exception("Not Exception")
    }
    var condExpr = ifExpr.condition
    var ifBody = ifExpr.ifBlock
    var elseBody = ifExpr.elseExpr
    var condExprValue = match (condExpr as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    var ifBodyExpr = match (ifBody as Block) {
        case Some(v) => v.nodes[0]
        case None => throw Exception("Not Block")
    }
    var ifBodyExprValue = match (ifBodyExpr as LitConstExpr) {
        case Some(v) => v.literal.value
        case None => throw Exception("Not LitConstExpr")
    }
    var elseBodyExpr = match (elseBody as Block) {
        case Some(v) => v.nodes[0]
        case None => throw Exception("Not Block")
    }
    var elseBodyExprValue = match (elseBodyExpr as LitConstExpr) {
        case Some(v) => v.literal.value
        case None => throw Exception("Not LitConstExpr")
    }
    if (condExprValue != "a" || ifBodyExprValue != "1" || elseBodyExprValue != "2") {
        return 1
    }
    return 0
}
