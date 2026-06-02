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
    var input: Tokens = quote([if (true) {a}, if (false) {b} else {c}, if (false) {b} else {c}])
    let expr = parseExpr(input)
    if (expr is ArrayLiteral) {
        var arrayliteral = match (expr as ArrayLiteral) {
            case Some(v) => v
            case None => throw Exception("Not ArrayLiteral")
        }
        var arrayliteral0 = arrayliteral.elements[0]
        var arrayliteral1 = arrayliteral.elements[1]
        var arrayliteral2 = arrayliteral.elements[2]
        var arrayliteral0conditionExpr = match (arrayliteral0 as IfExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not IfExpr")
        }
        var arrayliteral0conditionExprValue = match (arrayliteral0conditionExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var arrayliteral0ifbody = match (arrayliteral0 as IfExpr) {
            case Some(v) => v.ifBlock
            case None => throw Exception("Not IfExpr")
        }
        var arrayliteral0ifbodyExpr = match (arrayliteral0ifbody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var arrayliteral0ifbodyExprValue = match (arrayliteral0ifbodyExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var arrayliteral1ifbody = match (arrayliteral1 as IfExpr) {
            case Some(v) => v.elseExpr
            case None => throw Exception("Not IfExpr")
        }
        var arrayliteral1ifbodyExpr = match (arrayliteral1ifbody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var arrayliteral1ifbodyExprValue = match (arrayliteral1ifbodyExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var arrayliteral2ifbody = match (arrayliteral2 as IfExpr) {
            case Some(v) => v.ifBlock
            case None => throw Exception("Not IfExpr")
        }
        var arrayliteral2ifbodyExpr = match (arrayliteral2ifbody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var arrayliteral2ifbodyExprValue = match (arrayliteral2ifbodyExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (arrayliteral0conditionExprValue != "true" || arrayliteral0ifbodyExprValue != "a" ||
            arrayliteral1ifbodyExprValue != "c" || arrayliteral2ifbodyExprValue != "b") {
            return 1
        }
        return 0
    }
    return 5
}
