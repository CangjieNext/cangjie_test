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
    var input: Tokens = quote(func bar(a:Int32, b!:A, c!:C=C()){})
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

    var expr1 = match (expr.funcParams[1] as FuncParam) {
        case Some(v) => v.paramType
        case None => throw Exception("Not FuncParam")
    }
    var value1 = match (expr1 as RefType) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefType")
    }
    if (value1 != "A") {
        return 4
    }

    var expr2 = match (expr.funcParams[2] as FuncParam) {
        case Some(v) => v.expr
        case None => throw Exception("Not FuncParam")
    }
    var expr20 = match (expr2 as CallExpr) {
        case Some(v) => v.callFunc
        case None => throw Exception("Not CallExpr")
    }
    var value2 = match (expr20 as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (value2 != "C") {
        return 5
    }

    return 0
}
