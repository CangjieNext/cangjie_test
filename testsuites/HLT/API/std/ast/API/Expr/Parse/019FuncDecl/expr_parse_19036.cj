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
    var input: Tokens = quote(operator func +(b:Int64):Int64{})
    let b = parseDecl(input)
    var expr = match (b as FuncDecl) {
        case Some(v) => v
        case None => throw Exception("Not FuncDecl")
    }

    if (expr.modifiers[0].keyword.value != "operator") {
        return 1
    }

    if (expr.identifier.value != "+") {
        return 2
    }

    var block1 = match (expr.block as Block) {
        case Some(v) => v.nodes
        case None => throw Exception("Not Block")
    }
    if (block1.size != 0) {
        return 3
    }

    var value1 = match (expr.funcParams[0] as FuncParam) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not FuncParam")
    }
    if (value1 != "b") {
        return 4
    }

    return 0
}
