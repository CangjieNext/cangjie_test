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
    var input: Tokens = quote(func bar(a:Int64):Int64{})
    let b = parseDecl(input)
    var expr = match (b as FuncDecl) {
        case Some(v) => v
        case None => throw Exception("Not FuncDecl")
    }
    if (expr.identifier.value != "bar") {
        return 1
    }

    var blockExpr = match (expr.block as Block) {
        case Some(v) => v.nodes
        case None => throw Exception("Not Block")
    }
    if (blockExpr.size != 0) {
        return 2
    }

    var expr0 = match (expr.funcParams[0] as FuncParam) {
        case Some(v) => v
        case None => throw Exception("Not FuncParam")
    }
    if (expr0.identifier.value != "a") {
        return 3
    }
    var value0 = match (expr0.paramType as PrimitiveType) {
        case Some(v) => v.keyword.value
        case None => throw Exception("Not PrimitiveType")
    }
    if (value0 != "Int64") {
        return 4
    }
    return 0
}
