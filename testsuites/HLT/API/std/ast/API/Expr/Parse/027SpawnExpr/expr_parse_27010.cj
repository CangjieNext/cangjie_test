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
    var input: Tokens = quote(spawn{=>a+b;-b})
    let expr = parseExpr(input)
    var spawnExpr = match (expr as SpawnExpr) {
        case Some(v) => v
        case None => throw Exception("Not SpawnExpr")
    }
    var spawnExprlamdba = spawnExpr.lambdaExpr
    var spawnExprlamdba0Expr = match (spawnExprlamdba as LambdaExpr) {
        case Some(v) => v.nodes[0]
        case None => throw Exception("Not LambdaExpr")
    }
    var spawnExprlamdba0Exprleft = match (spawnExprlamdba0Expr as BinaryExpr) {
        case Some(v) => v.leftExpr
        case None => throw Exception("Not BinaryExpr")
    }
    var spawnExprlamdba0ExprleftValue = match (spawnExprlamdba0Exprleft as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    var spawnExprlamdba1Expr = match (spawnExprlamdba as LambdaExpr) {
        case Some(v) => v.nodes[1]
        case None => throw Exception("Not LambdaExpr")
    }
    var spawnExprlamdba1UnaryExpr = match (spawnExprlamdba1Expr as UnaryExpr) {
        case Some(v) => v.expr
        case None => throw Exception("Not BinaryExpr")
    }
    var spawnExprlamdba1UnaryExprValue = match (spawnExprlamdba1UnaryExpr as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (spawnExprlamdba0ExprleftValue != "a" || spawnExprlamdba1UnaryExprValue != "b") {
        return 1
    }
    return 0
}
