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
        for (i in a << b where a << b){
            a << b
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
        var InExprleft = match (InExpr as BinaryExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var InExprleftValue = match (InExprleft as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var patternGuardleft = match (patternGuard as BinaryExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var patternGuardleftValue = match (patternGuardleft as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var bodySize = match (body as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodySizeleft = match (bodySize as BinaryExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var bodySizeleftValue = match (bodySizeleft as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (pattrenExprValue != "i" || InExprleftValue != "a" || patternGuardleftValue != "a" || bodySizeleftValue != "a") {
            return 1
        }
        return 0
    }
    return 1
}
