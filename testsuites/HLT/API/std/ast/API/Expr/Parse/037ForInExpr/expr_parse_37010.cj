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
        for (i in a is A where a is A){
            a is Int64
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
        var InExprleft = match (InExpr as IsExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not IsExpr")
        }
        var InExprleftValue = match (InExprleft as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var patternGuardright = match (patternGuard as IsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not IsExpr")
        }
        var patternGuardrightValue = match (patternGuardright as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        var bodySize = match (body as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodySizeright = match (bodySize as IsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not IsExpr")
        }
        var bodySizerightValue = match (bodySizeright as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (pattrenExprValue != "i" || InExprleftValue != "a" || patternGuardrightValue != "A" || bodySizerightValue !=
            "Int64") {
            return 1
        }
        return 0
    }
    return 1
}
