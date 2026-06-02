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
    var input: Tokens = quote(spawn{=> start..stop:step })
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
    var spawnExprlamdbaRangeExpr = match (spawnExprlamdbaExpr as RangeExpr) {
        case Some(v) => v.start
        case None => throw Exception("Not RangeExpr")
    }
    var spawnExprlamdbaRangeExprValue = match (spawnExprlamdbaRangeExpr as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (spawnExprlamdbaRangeExprValue != "start") {
        return 1
    }
    return 0
}
