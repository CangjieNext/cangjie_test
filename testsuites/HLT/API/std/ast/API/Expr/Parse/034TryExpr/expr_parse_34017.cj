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
    var input: Tokens = quote(
        try {
            { x:Int32 => 2 }
            a(){3}
            spawn {x}
        } catch(e: RunTime) {
            { x:Int32 => 2 }
            a(){3}
            spawn {x}
        } finally {
            { x:Int32 => 2 }
            a(){3}
            spawn {x}
        }
    )
    let expr = parseExpr(input)
    if (expr is TryExpr) {
        var b = match (expr as TryExpr) {
            case Some(v) => v
            case None => throw Exception("Not TryExpr")
        }

        var tryBlock = match (b.tryBlock as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var aExpr = match (tryBlock[0] as LambdaExpr) {
            case Some(v) => v.funcParams
            case None => throw Exception("Not LambdaExpr")
        }

        var xValue = match (aExpr[0] as FuncParam) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not FuncParam")
        }
        if (xValue != "x") {
            return 2
        }

        if (!(b.catchPatterns[0] is ExceptTypePattern)) {
            return 3
        }

        var catchPattern = match (b.catchPatterns[0] as ExceptTypePattern) {
            case Some(v) => v.types
            case None => throw Exception("Not ExceptTypePattern")
        }
        var runValue = match (catchPattern[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (runValue != "RunTime") {
            return 4
        }

        var catchBlock0 = match (b.catchBlocks[0] as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }

        var catchBlock01 = match (catchBlock0[1] as TrailingClosureExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not TrailingClosureExpr")
        }

        var wbBlock = match (catchBlock01 as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var bValue = match (wbBlock as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (bValue != "a") {
            return 5
        }

        var finalBlock = match (b.finallyBlock as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var eExpr = match (finalBlock[2] as SpawnExpr) {
            case Some(v) => v.lambdaExpr
            case None => throw Exception("Not SpawnExpr")
        }
        var cExpr = match (eExpr as LambdaExpr) {
            case Some(v) => v.nodes
            case None => throw Exception("Not LambdaExpr")
        }
        var cValue = match (cExpr[0] as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (cValue != "x") {
            return 6
        }
        return 0
    }
    return 1
}
