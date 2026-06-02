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
    var input: Tokens = quote(func bar():Int64{if (a) {b} else {c}})
    let b = parseDecl(input)
    if (b is FuncDecl) {
        var expr = match (b as FuncDecl) {
            case Some(v) => v
            case None => throw Exception("Not FuncDecl")
        }
        if (expr.identifier.value != "bar") {
            return 1
        }

        var bExpr = expr.block
        var blockExpr = match (bExpr as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var blockExpr1 = match (blockExpr[0] as IfExpr) {
            case Some(v) => v.ifBlock
            case None => throw Exception("Not IfExpr")
        }
        var blockExpr2 = match (blockExpr1 as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var value1 = match (blockExpr2[0] as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (value1 != "b") {
            return 2
        }

        var value3 = match (expr.declType as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value3 != "Int64") {
            return 3
        }

        if (expr.funcParams.size != 0) {
            return 4
        }
        return 0
    }
    return 10
}
