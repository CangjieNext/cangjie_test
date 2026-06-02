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
    var input: Tokens = quote([1+2,a+b, a+b])
    let expr = parseExpr(input)
    if (expr is ArrayLiteral) {
        var arrayliteral0 = match (expr as ArrayLiteral) {
            case Some(v) => v.elements[0]
            case None => throw Exception("Not ArrayLiteral")
        }
        var arrayliteral0left = match (arrayliteral0 as BinaryExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var arrayliteral0leftValue = match (arrayliteral0left as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var arrayliteral0right = match (arrayliteral0 as BinaryExpr) {
            case Some(v) => v.rightExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var arrayliteral0rightValue = match (arrayliteral0right as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var arrayliteral1 = match (expr as ArrayLiteral) {
            case Some(v) => v.elements[1]
            case None => throw Exception("Not ArrayLiteral")
        }
        var arrayliteral1left = match (arrayliteral1 as BinaryExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var arrayliteral1leftValue = match (arrayliteral1left as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var arrayliteral1right = match (arrayliteral1 as BinaryExpr) {
            case Some(v) => v.rightExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var arrayliteral1rightValue = match (arrayliteral1right as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var arrayliteral2 = match (expr as ArrayLiteral) {
            case Some(v) => v.elements[2]
            case None => throw Exception("Not ArrayLiteral")
        }
        var arrayliteral2left = match (arrayliteral2 as BinaryExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var arrayliteral2leftValue = match (arrayliteral2left as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (arrayliteral0leftValue != "1" || arrayliteral0rightValue != "2" || arrayliteral1leftValue != "a" ||
            arrayliteral1rightValue != "b" || arrayliteral2leftValue != "a") {
            return 1
        }
        return 0
    }
    return 5
}
