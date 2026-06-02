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

        if (b.catchPatterns.size != 0) {
            return 3
        }

        return 0
    }
    return 1
}
