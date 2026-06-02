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
    var input: Tokens = quote(spawn{=> foo(){=>2} })
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
    var spawnExprlamdbaTrailingClosureExpr = match (spawnExprlamdbaExpr as TrailingClosureExpr) {
        case Some(v) => v.expr
        case None => throw Exception("Not TrailingClosureExpr")
    }
    var spawnExprlamdbaTrailingClosureCallExpr = match (spawnExprlamdbaTrailingClosureExpr as CallExpr) {
        case Some(v) => v.callFunc
        case None => throw Exception("Not CallExpr")
    }
    var spawnExprlamdbaTrailingClosureCallExprValue = match (spawnExprlamdbaTrailingClosureCallExpr as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (spawnExprlamdbaTrailingClosureCallExprValue != "foo") {
        return 1
    }
    return 0
}
