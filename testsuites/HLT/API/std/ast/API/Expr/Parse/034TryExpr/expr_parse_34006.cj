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
        try (input: Stream = FileInputStream("input.txt"),
            output: Stream = FileOutputStream("output.txt")) {
            while (input.hasNextLine()) {
                let lineString = input.readLine()
                output.writeLine(lineString)
            }
        } catch (e: IOException) {
            print("IOException happened when executing the try-with-resources expression")
        } finally {
            print("end of the try-with-resources expression")
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
        var conExpr = match (tryBlock[0] as WhileExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not WhileExpr")
        }
        var callExpr = match (conExpr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var memExpr = match (callExpr as MemberAccess) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not MemberAccess")
        }
        var value1 = match (memExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (value1 != "input") {
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
        if (runValue != "IOException") {
            return 4
        }

        var cpExpr = match (b.catchPatterns[0] as ExceptTypePattern) {
            case Some(v) => v.pattern
            case None => throw Exception("Not RefType")
        }
        if (cpExpr is WildcardPattern) {
            return 5
        }

        var varExpr1 = match (b.catchBlocks[0] as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var callExpr1 = match (varExpr1[0] as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var cValue = match (callExpr1 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (cValue != "print") {
            return 6
        }

        var varExpr2 = match (b.finallyBlock as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var callExpr2 = match (varExpr2[0] as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var cValue1 = match (callExpr2 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (cValue1 != "print") {
            return 7
        }

        return 0
    }
    return 1
}
