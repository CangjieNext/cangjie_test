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
    var input: Tokens = quote(func bar(a:Int64):Int64{var b=1; -b; return 2})
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
        var value0 = match (blockExpr[0] as VarDecl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarDecl")
        }
        if (value0 != "b") {
            return 2
        }

        var expr1 = match (blockExpr[1] as UnaryExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not UnaryExpr")
        }
        var value1 = match (expr1 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (value1 != "b") {
            return 3
        }

        var expr2 = match (blockExpr[2] as ReturnExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ReturnExpr")
        }
        var value2 = match (expr2 as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (value2 != "2") {
            return 4
        }

        var value3 = match (expr.declType as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value3 != "Int64") {
            return 5
        }

        var value4 = match (expr.funcParams[0] as FuncParam) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not FuncParam")
        }
        if (value4 != "a") {
            return 6
        }

        var expr5 = match (expr.funcParams[0] as FuncParam) {
            case Some(v) => v.paramType
            case None => throw Exception("Not FuncParam")
        }
        var value5 = match (expr5 as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value5 != "Int64") {
            return 7
        }
        return 0
    }
    return 10
}
