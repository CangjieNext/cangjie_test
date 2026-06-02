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
    var input: Tokens = quote(do { {c:Int32 => d} } while ({a:Int32=>b}))
    let expr = parseExpr(input)
    if (expr is DoWhileExpr) {
        var doWhileExpr = match (expr as DoWhileExpr) {
            case Some(v) => v
            case None => throw Exception("Not DoWhileExpr")
        }
        var condExpr = doWhileExpr.condition
        var bodyExpr = doWhileExpr.block
        var condExprLambdaExpr = match (condExpr as LambdaExpr) {
            case Some(v) => v.funcParams[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var condExprLambdaExprValue = match (condExprLambdaExpr as Decl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not Decl")
        }
        var bodyExprblock = match (bodyExpr as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodyExprblockLambdaExpr = match (bodyExprblock as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var bodyExprblockLambdaExprValue = match (bodyExprblockLambdaExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (condExprLambdaExprValue != "a" || bodyExprblockLambdaExprValue != "d") {
            return 1
        }
        return 0
    }
    return 10
}
