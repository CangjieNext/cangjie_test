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
             throw RunTime()
        } catch(e: RunTime) {
             throw RunTime()
        } finally {
             throw RunTime()
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
        var aExpr = match (tryBlock[0] as ThrowExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ThrowExpr")
        }
        var callExpr = match (aExpr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var aValue = match (callExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (aValue != "RunTime") {
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
        var aExpr1 = match (catchBlock0[0] as ThrowExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ThrowExpr")
        }
        var aExpr2 = match (aExpr1 as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var caValue = match (aExpr2 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (caValue != "RunTime") {
            return 4
        }

        var finalBlock = match (b.finallyBlock as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var aExpr3 = match (finalBlock[0] as ThrowExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ThrowExpr")
        }
        var aExpr4 = match (aExpr3 as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var caValue1 = match (aExpr4 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (caValue1 != "RunTime") {
            return 4
        }
        return 0
    }
    return 1
}
