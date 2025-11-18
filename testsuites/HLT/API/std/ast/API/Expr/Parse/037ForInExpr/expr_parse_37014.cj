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
//     var input: Tokens = quote(
//         for (i in a() where b(2)){
//             c(x:y)
//         }
//     )
//     let expr = parseExpr(input)
//     if (expr.isForInExpr()) {
//         var forExpr = expr.asForInExpr()
//         if (forExpr.getPattern().asVarPattern().getVarDecl().getIdentifier().value != "i") {
//             return 2
//         }
//         if (forExpr.getInExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "a") {
//             return 3
//         }
//         if (forExpr.getPatternGuard().getOrThrow().asCallExpr().Process.current.arguments[0].getExpr().asLitConstExpr().getLiteral().value != "2") {
//             return 6
//         }
//         if (forExpr.getBody()[0].asExpr().asCallExpr().Process.current.arguments[0].getName().getOrThrow().value != "x") {
//             return 7
//         }
//         return 0
//     }
//     return 1
// }

main() {
    var input: Tokens = quote(
        for (i in a() where b(2)){
            c(x:y)
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
        var InExprCall = match (InExpr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var InExprCallValue = match (InExprCall as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var patternGuardCall = match (patternGuard as CallExpr) {
            case Some(v) => v.arguments[0]
            case None => throw Exception("Not CallExpr")
        }
        var patternGuardCallExpr = match (patternGuardCall as Argument) {
            case Some(v) => v.expr
            case None => throw Exception("Not Argument")
        }
        var patternGuardCallExprValue = match (patternGuardCallExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var bodyCall = match (body as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodyCallExpr = match (bodyCall as CallExpr) {
            case Some(v) => v.arguments[0]
            case None => throw Exception("Not CallExpr")
        }
        var bodyCallExprArgValue = match (bodyCallExpr as Argument) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not Argument")
        }
        if (pattrenExprValue != "i" || InExprCallValue != "a" || patternGuardCallExprValue != "2" ||
            bodyCallExprArgValue != "x") {
            return 1
        }
        return 0
    }
    return 1
}
