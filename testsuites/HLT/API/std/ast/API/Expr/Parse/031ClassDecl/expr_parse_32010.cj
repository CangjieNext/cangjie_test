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

main(): Int64 {
    var input: Tokens = quote(
        public open struct A<T, V> <: C & I where T<:Int32, V<:C & A {
            var a = 2
            func foo<T>(a:T):Int64 {}
        }
    )
    let expr = parseDecl(input)
    if (expr is StructDecl) {
        var b = match (expr as StructDecl) {
            case Some(v) => v
            case None => throw Exception("Not StructDecl")
        }
        var bodyExpr0 = match (b.body as Body) {
            case Some(v) => v.decls[0]
            case None => throw Exception("Not Body")
        }
        var bodyExpr1 = match (b.body as Body) {
            case Some(v) => v.decls[1]
            case None => throw Exception("Not Body")
        }
        let funcDeclOfRecord = match (bodyExpr1 as FuncDecl) {
            case Some(v) => v
            case None => throw Exception("Not FuncDecl")
        }
        let varDeclOfRecord = match (bodyExpr0 as VarDecl) {
            case Some(v) => v
            case None => throw Exception("Not VarDecl")
        }
        if (varDeclOfRecord.identifier.value != "a") {
            return 2
        }
        let eLit = match (varDeclOfRecord.expr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (eLit != "2") {
            return 3
        }
        if (funcDeclOfRecord.identifier.value != "foo") {
            return 4
        }
        let typeExpr = match (funcDeclOfRecord.declType as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (typeExpr != "Int64") {
            return 5
        }
        let blockExpr = match (funcDeclOfRecord.block as Block) {
            case Some(v) => v.nodes.size
            case None => throw Exception("Not Block")
        }
        if (blockExpr != 0) {
            return 6
        }
        return 0
    }
    return 1
}
