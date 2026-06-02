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
            var a = b + 1
        } catch(_: RunTime | Argument| ValueError) {
            e.back_trace()
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
        var varExpr = match (tryBlock[0] as VarDecl) {
            case Some(v) => v.expr
            case None => throw Exception("Not VarDecl")
        }
        var binaryExpr = match (varExpr as BinaryExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var bValue = match (binaryExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        if (bValue != "b") {
            return 2
        }

        if (!(b.catchPatterns[0] is ExceptTypePattern)) {
            return 3
        }

        var catchBlock = match (b.catchPatterns[0] as ExceptTypePattern) {
            case Some(v) => v.types
            case None => throw Exception("Not ExceptTypePattern")
        }
        var runValue = match (catchBlock[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (runValue != "RunTime") {
            return 4
        }

        var cpExpr = match (b.catchPatterns[0] as ExceptTypePattern) {
            case Some(v) => v.pattern
            case None => throw Exception("Not RefType")
        }
        if (!(cpExpr is WildcardPattern)) {
            return 5
        }

        var catchTypesExpr = match (b.catchPatterns[0] as ExceptTypePattern) {
            case Some(v) => v.types
            case None => throw Exception("Not RefType")
        }
        var argValue1 = match (catchTypesExpr[1] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (argValue1 != "Argument") {
            return 6
        }

        var argValue2 = match (catchTypesExpr[2] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (argValue2 != "ValueError") {
            return 7
        }

        var varExpr1 = match (b.catchBlocks[0] as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var callExpr = match (varExpr1[0] as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var maExpr = match (callExpr as MemberAccess) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not MemberAccess")
        }
        var eValue1 = match (maExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (eValue1 != "e") {
            return 9
        }
        return 0
    }
    return 1
}
