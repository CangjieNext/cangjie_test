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

main(): Int64 {
    var input: Tokens = quote(
        do {
            if (true){
                c
            } else {
                d
            }
        } while (
                if (false) {
                    a
                } else {
                    b
                }
            )
        )
    let expr = parseExpr(input)
    if (expr is DoWhileExpr) {
        var doWhileExpr = match (expr as DoWhileExpr) {
            case Some(v) => v
            case None => throw Exception("Not DoWhileExpr")
        }
        var condExpr = doWhileExpr.condition
        var bodyExpr = doWhileExpr.block
        var condExprIfBlack = match (condExpr as IfExpr) {
            case Some(v) => v.ifBlock
            case None => throw Exception("Not IfExpr")
        }
        var condExprIfBlackExpr = match (condExprIfBlack as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var condExprIfBlackExprValue = match (condExprIfBlackExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var bodyExprblock = match (bodyExpr as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodyExprblockelse = match (bodyExprblock as IfExpr) {
            case Some(v) => v.elseExpr
            case None => throw Exception("Not IfExpr")
        }
        var bodyExprblockelseExpr = match (bodyExprblockelse as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bbodyExprblockelseExprValue = match (bodyExprblockelseExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (condExprIfBlackExprValue != "a" || bbodyExprblockelseExprValue != "d") {
            return 1
        }
        return 0
    }
    return 10
}
