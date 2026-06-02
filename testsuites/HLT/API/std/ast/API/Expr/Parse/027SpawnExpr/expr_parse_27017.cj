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
    var input: Tokens = quote(spawn{=>if (true) {a} else {b}})
    let expr = parseExpr(input)
    var spawnExpr = match (expr as SpawnExpr) {
        case Some(v) => v
        case None => throw Exception("Not SpawnExpr")
    }
    var spawnExprlamdba = spawnExpr.lambdaExpr
    var spawnExprlamdbaExpr = match (spawnExprlamdba as LambdaExpr) {
        case Some(v) => v.nodes[0]
        case None => throw Exception("Not LambdaExpr")
    }
    var spawnExprlamdbaIfExpr = match (spawnExprlamdbaExpr as IfExpr) {
        case Some(v) => v
        case None => throw Exception("Not IfExpr")
    }
    var condExpr = spawnExprlamdbaIfExpr.condition
    var ifBody = spawnExprlamdbaIfExpr.ifBlock
    var elseBody = spawnExprlamdbaIfExpr.elseExpr
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
    var elseBodyExprValue = match (elseBodyExpr as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (condExprValue != "true" || ifBodyExprValue != "a" || elseBodyExprValue != "b") {
        return 1
    }
    return 0
}
