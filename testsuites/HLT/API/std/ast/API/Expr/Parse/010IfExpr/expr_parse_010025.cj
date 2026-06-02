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

// main() {
//     var input : Tokens = quote(
//         if (false) {
//              start..stop:step
//         } else {
//              0..10:step
//         }
//     )
//     let expr = parseExpr(input)
//     if (expr.isIfExpr()) {
//         var b = expr.asIfExpr()
//         if (b.getCondExpr().asLitConstExpr().getLiteral().value != "false") {
//             return 1
//         }
//         if (b.getIfBody()[0].asExpr().asRangeExpr().getStartExpr().asRefExpr().getIdentifier().value != "start") {
//             return 2
//         }
//         if (b.getElseBody()[0].asExpr().asRangeExpr().getStepExpr().getOrThrow().asRefExpr().getIdentifier().value != "step") {
//             return 3
//         }

//         return 0
//     }
//     return 4
// }

main() {
    var input: Tokens = quote(
        if (false) {
             start..stop:step
        } else {
             0..10:step
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
        var ifBodyRangeExpr = match (ifBodyExpr as RangeExpr) {
            case Some(v) => v.start
            case None => throw Exception("Not RangeExpr")
        }
        var ifBodyRangeExprValue = match (ifBodyRangeExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var elseBodyExpr = match (elseBody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var elseBodyRangeExpr = match (elseBodyExpr as RangeExpr) {
            case Some(v) => v.step
            case None => throw Exception("Not RangeExpr")
        }
        var elseBodyRangeExprValue = match (elseBodyRangeExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (condExprValue != "false" || ifBodyRangeExprValue != "start" || elseBodyRangeExprValue != "step") {
            return 1
        }
        return 0
    }
    return 4
}
