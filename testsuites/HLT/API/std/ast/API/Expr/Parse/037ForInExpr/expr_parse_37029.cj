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
        for (i in try {} catch(_) {} finally {} where try {} catch(_) {} finally {}){
            try {} catch(_) {} finally {}
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
        var InExprTry = match (InExpr as TryExpr) {
            case Some(v) => v.catchPatterns[0]
            case None => throw Exception("Not TryExpr")
        }
        var patternGuardTry = match (patternGuard as TryExpr) {
            case Some(v) => v.catchPatterns[0]
            case None => throw Exception("Not TryExpr")
        }
        var bodyTry = match (body as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodyTrycatch = match (bodyTry as TryExpr) {
            case Some(v) => v.catchPatterns[0]
            case None => throw Exception("Not TryExpr")
        }
        if (pattrenExprValue != "i" || !(InExprTry is WildcardPattern) || !(patternGuardTry is WildcardPattern) ||
            !(bodyTrycatch is WildcardPattern)) {
            return 1
        }
        return 0
    }
    return 1
}
