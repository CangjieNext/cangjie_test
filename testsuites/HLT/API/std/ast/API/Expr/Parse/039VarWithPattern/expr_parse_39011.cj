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
import std.unicode.*

main() {
    var input: Tokens = quote(
        public var A(x:Int32): TimeUnit = TimeUnit.Day(1)
    )
    let expr = parseDecl(input)
    if (expr is VarDecl) {
        var b = match (expr as VarDecl) {
            case Some(v) => v
            case None => throw Exception("Not VarDecl")
        }
        var modifier = b.modifiers[0]
        var modifiersExpr = match (modifier as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        var typeExpr = b.keyword.value
        var tp = b.pattern
        var tpconst = match (tp as EnumPattern) {
            case Some(v) => v.constructor
            case None => throw Exception("Not EnumPattern")
        }
        var tpconstexpr = match (tpconst as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var inPattern = match (tp as EnumPattern) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not EnumPattern")
        }
        inPattern.toTokens().dump()
        var dt = b.declType
        var dtExpr = match (dt as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        var e = b.expr
        var ecall = match (e as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var emember = match (ecall as MemberAccess) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not MemberAccess")
        }
        var eExpr = match (emember as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (modifiersExpr != "public" || typeExpr != "var" || tpconstexpr != "A" || !(inPattern is TypePattern) ||
            dtExpr != "TimeUnit" || eExpr != "TimeUnit") {
            return 1
        }
        return 0
    }
    return 1
}
