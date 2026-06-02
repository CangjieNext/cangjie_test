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
    var input: Tokens = quote(public func foo(a:A,b!:Int64=1):Int64 {})
    let b = parseDecl(input)
    var expr = match (b as FuncDecl) {
        case Some(v) => v
        case None => throw Exception("Not FuncDecl")
    }
    if (expr.modifiers[0].keyword.value != "public") {
        return 1
    }

    var expr0 = match (expr.funcParams[0] as FuncParam) {
        case Some(v) => v
        case None => throw Exception("Not FuncParam")
    }
    if (expr0.identifier.value != "a") {
        return 2
    }
    var value0 = match (expr0.paramType as RefType) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefType")
    }
    if (value0 != "A") {
        return 3
    }

    var expr1 = match (expr.funcParams[1] as FuncParam) {
        case Some(v) => v
        case None => throw Exception("Not FuncParam")
    }
    var value1 = match (expr1.expr as LitConstExpr) {
        case Some(v) => v.literal.value
        case None => throw Exception("Not LitConstExpr")
    }
    if (value1 != "1") {
        return 4
    }
    var value2 = match (expr1.paramType as PrimitiveType) {
        case Some(v) => v.keyword.value
        case None => throw Exception("Not PrimitiveType")
    }
    if (value2 != "Int64") {
        return 5
    }

    if (expr.identifier.value != "foo") {
        return 6
    }

    var blockExpr = match (expr.block as Block) {
        case Some(v) => v.nodes
        case None => throw Exception("Not Block")
    }
    if (blockExpr.size != 0) {
        return 8
    }
    return 0
}
