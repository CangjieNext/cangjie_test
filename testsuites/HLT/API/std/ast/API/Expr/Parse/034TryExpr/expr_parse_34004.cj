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
        } catch(e1: RunTime) {
            e1.back_trace()
        } catch(e2: Argument) {
            e2.back_trace()
        } catch(e3: Int64) {
            e3.back_trace()
        } finally {
            a = 2
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
            return 3
        }

        if (!(b.catchPatterns[0] is ExceptTypePattern)) {
            return 4
        }

        var catchpattern = match (b.catchPatterns[0] as ExceptTypePattern) {
            case Some(v) => v.types
            case None => throw Exception("Not ExceptTypePattern")
        }
        var runValue = match (catchpattern[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (runValue != "RunTime") {
            return 5
        }

        var catchpattern1 = match (b.catchPatterns[1] as ExceptTypePattern) {
            case Some(v) => v.types
            case None => throw Exception("Not ExceptTypePattern")
        }
        var catchValue0 = match (catchpattern1[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (catchValue0 != "Argument") {
            return 6
        }

        var catchpattern2 = match (b.catchPatterns[2] as ExceptTypePattern) {
            case Some(v) => v.types
            case None => throw Exception("Not ExceptTypePattern")
        }
        var catchValue1 = match (catchpattern2[0] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (catchValue1 != "Int64") {
            return 7
        }

        var catchBlock1 = match (b.catchBlocks[0] as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var cb1Expr = match (catchBlock1[0] as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var maExpr = match (cb1Expr as MemberAccess) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not MemberAccess")
        }
        var eValue1 = match (maExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (eValue1 != "e1") {
            return 8
        }

        var btValue = match (cb1Expr as MemberAccess) {
            case Some(v) => v.field.value
            case None => throw Exception("Not MemberAccess")
        }
        if (btValue != "back_trace") {
            return 9
        }

        var catchBlock2 = match (b.catchBlocks[2] as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }

        var cb1Expr2 = match (catchBlock2[0] as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var maExpr2 = match (cb1Expr2 as MemberAccess) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not MemberAccess")
        }
        var eValue2 = match (maExpr2 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        if (eValue2 != "e3") {
            return 10
        }

        var finalBlock = match (b.finallyBlock as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var varExpr2 = match (finalBlock[0] as AssignExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not AssignExpr")
        }
        var aValue = match (varExpr2 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (aValue != "a") {
            return 11
        }
        return 0
    }
    return 1
}
