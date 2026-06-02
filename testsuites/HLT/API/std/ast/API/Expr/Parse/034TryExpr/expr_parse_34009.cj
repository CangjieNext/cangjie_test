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
            try {} catch(_) {}
        } catch(e: RunTime) {
            try {} catch(_) {}
        } finally {
            try {} catch(_) {}
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
        var tryBlock1 = match (tryBlock[0] as TryExpr) {
            case Some(v) => v.catchPatterns
            case None => throw Exception("Not TryExpr")
        }
        if (!(tryBlock1[0] is WildcardPattern)) {
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
        var catchBlock01 = match (catchBlock0[0] as TryExpr) {
            case Some(v) => v.catchPatterns
            case None => throw Exception("Not TryExpr")
        }
        if (!(catchBlock01[0] is WildcardPattern)) {
            return 5
        }

        var finalBlock = match (b.finallyBlock as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var finalBlock1 = match (finalBlock[0] as TryExpr) {
            case Some(v) => v.catchPatterns
            case None => throw Exception("Not TryExpr")
        }
        if (!(finalBlock1[0] is WildcardPattern)) {
            return 6
        }

        return 0
    }
    return 1
}
