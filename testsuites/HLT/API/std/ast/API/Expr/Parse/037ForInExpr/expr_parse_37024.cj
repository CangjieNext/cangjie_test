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
        for (i in { x:Int32 => 2 } where { x:Int32 => 2 }){
            { x:Int32 => 2 }
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
        var InExprLambda = match (InExpr as LambdaExpr) {
            case Some(v) => v.funcParams[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var InExprLambdaExpr = match (InExprLambda as Decl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not Decl")
        }
        var patternGuardLambda = match (patternGuard as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var ppatternGuardLambdaValue = match (patternGuardLambda as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var bodyLambda = match (body as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodyLambdaExpr = match (bodyLambda as LambdaExpr) {
            case Some(v) => v.funcParams[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var bodyLambdaExprrValue = match (bodyLambdaExpr as Decl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not Decl")
        }
        if (pattrenExprValue != "i" || InExprLambdaExpr != "x" || ppatternGuardLambdaValue != "2" ||
            bodyLambdaExprrValue != "x") {
            return 1
        }
        return 0
    }
    return 1
}
