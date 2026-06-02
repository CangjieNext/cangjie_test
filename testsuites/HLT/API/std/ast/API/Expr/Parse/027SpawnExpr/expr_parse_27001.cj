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
    var input: Tokens = quote(spawn {a})
    let expr = parseExpr(input)
    if (expr is SpawnExpr) {
        var spawnExpr = match (expr as SpawnExpr) {
            case Some(v) => v
            case None => throw Exception("Not SpawnExpr")
        }
        var spawnExprlamdba = spawnExpr.lambdaExpr
        var spawnExprlamdbaExpr = match (spawnExprlamdba as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var spawnExprlamdbaExprValue = match (spawnExprlamdbaExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (spawnExprlamdbaExprValue != "a") {
            return 1
        }

        return 0
    }
    return 3
}
