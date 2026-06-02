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
        synchronized(mtx) {
            { x:Int32 => 2 }
            a(){3}
            spawn {x}
        }
    )
    let expr = parseExpr(input)
    if (expr is SynchronizedExpr) {
        var synchronizedExpr = match (expr as SynchronizedExpr) {
            case Some(v) => v
            case None => throw Exception("Not SynchronizedExpr")
        }
        var mutex = synchronizedExpr.structuredMutex
        var blockExpr = synchronizedExpr.block
        var mutexExpr = match (mutex as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var blockExpr0 = match (blockExpr as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var blockExprLambdaExpr = match (blockExpr0 as LambdaExpr) {
            case Some(v) => v.funcParams[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var blockExprLambdaExprValue = match (blockExprLambdaExpr as Decl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not Decl")
        }
        var blockExpr1 = match (blockExpr as Block) {
            case Some(v) => v.nodes[1]
            case None => throw Exception("Not Block")
        }
        var blockExprTrailingClosureExpr = match (blockExpr1 as TrailingClosureExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not TrailingClosureExpr")
        }
        var blockExprTrailingClosureCallExpr = match (blockExprTrailingClosureExpr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var blockExprTrailingClosureCallExprValue = match (blockExprTrailingClosureCallExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var blockExpr2 = match (blockExpr as Block) {
            case Some(v) => v.nodes[2]
            case None => throw Exception("Not Block")
        }
        var blockExprSpawnExpr = match (blockExpr2 as SpawnExpr) {
            case Some(v) => v.lambdaExpr
            case None => throw Exception("Not SpawnExpr")
        }
        var blockExprSpawnLamdbaExpr = match (blockExprSpawnExpr as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var blockExprSpawnLamdbaExprValue = match (blockExprSpawnLamdbaExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (mutexExpr != "mtx" || blockExprLambdaExprValue != "x" || blockExprTrailingClosureCallExprValue != "a" ||
            blockExprSpawnLamdbaExprValue != "x") {
            return 1
        }
        return 0
    }
    return 5
}
