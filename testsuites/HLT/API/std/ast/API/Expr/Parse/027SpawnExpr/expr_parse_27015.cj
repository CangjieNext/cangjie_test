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
//     var input : Tokens = quote(spawn{=>a=b})
//     let expr = parseSpawnExpr(input)
//     var b = expr.getTaskExpr().asLambdaExpr()
//     if  (b.getLambdaBody()[0].asExpr().asAssignExpr().getRightExpr().asRefExpr().getIdentifier().value != "b") {
//         return 3
//     }
//     return 0

// }

main() {
    var input: Tokens = quote(spawn{=>a=b})
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
    var spawnExprlamdbaAssignExpr = match (spawnExprlamdbaExpr as AssignExpr) {
        case Some(v) => v.rightExpr
        case None => throw Exception("Not AssignExpr")
    }
    var spawnExprlamdbaAssignExprValue = match (spawnExprlamdbaAssignExpr as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (spawnExprlamdbaAssignExprValue != "b") {
        return 1
    }
    return 0
}
