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
        for (i in spawn {x} where spawn {x}){
            spawn {x}
        }
    )
    let expr = parseExpr(input)
    if (expr is ForInExpr) {
        var forExpr = match (expr as ForInExpr) {
            case Some(v) => v
            case None => throw Exception("Not ForInExpr")
        }
        var pattrenExpr = forExpr.pattern
        var InExpr = forExpr.expr
        var body = forExpr.block
        var patternGuard = forExpr.patternGuard
        var pattrenExprValue = match (pattrenExpr as VarPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarPattern")
        }
        var InExprSpawn = match (InExpr as SpawnExpr) {
            case Some(v) => v.lambdaExpr
            case None => throw Exception("Not SpawnExpr")
        }
        var InExprSpawnExpr = match (InExprSpawn as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var InExprSpawnExprValue = match (InExprSpawnExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var patternGuardSpawn = match (patternGuard as SpawnExpr) {
            case Some(v) => v.lambdaExpr
            case None => throw Exception("Not SpawnExpr")
        }
        var patternGuardSpawnExpr = match (patternGuardSpawn as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var patternGuardSpawnExprValue = match (patternGuardSpawnExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var bodySpawn = match (body as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodySpawnBody = match (bodySpawn as SpawnExpr) {
            case Some(v) => v.lambdaExpr
            case None => throw Exception("Not SpawnExpr")
        }
        var bodySpawnBodyExpr = match (bodySpawnBody as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var bodySpawnBodyExprValue = match (bodySpawnBodyExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (pattrenExprValue != "i" || InExprSpawnExprValue != "x" || patternGuardSpawnExprValue != "x" ||
            bodySpawnBodyExprValue != "x") {
            return 1
        }
        return 0
    }
    return 1
}
