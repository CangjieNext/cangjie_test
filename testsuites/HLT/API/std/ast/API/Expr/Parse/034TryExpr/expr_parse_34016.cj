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
            while (a) {c}
            do {b} while(d)
        } catch(e: RunTime) {
            while (a) {c}
            do {b} while(d)
        } finally {
            while (a) {c}
            do {b} while(d)
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
        var aExpr = match (tryBlock[0] as WhileExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not WhileExpr")
        }
        var aValue = match (aExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (aValue != "a") {
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

        var catchBlock01 = match (catchBlock0[1] as DoWhileExpr) {
            case Some(v) => v.block
            case None => throw Exception("Not DoWhileExpr")
        }

        var wbBlock = match (catchBlock01 as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var bValue = match (wbBlock[0] as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (bValue != "b") {
            return 5
        }

        var finalBlock = match (b.finallyBlock as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var eExpr = match (finalBlock[1] as DoWhileExpr) {
            case Some(v) => v.block
            case None => throw Exception("Not DoWhileExpr")
        }
        var cExpr = match (eExpr as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not RefExpr")
        }
        var cValue = match (cExpr[0] as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (cValue != "b") {
            return 6
        }

        return 0
    }
    return 1
}
