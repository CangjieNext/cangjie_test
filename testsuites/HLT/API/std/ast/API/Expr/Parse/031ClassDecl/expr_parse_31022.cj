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
        abstract class A<T, V> <: C & I where T<:Int32, V<:C & A {
             init(a:Int64, b!: String, c!:()->Int64={=>1}){}
        }
    )
    let expr = parseDecl(input)
    if (expr is ClassDecl) {
        var b = match (expr as ClassDecl) {
            case Some(v) => v
            case None => throw Exception("Not ClassDecl")
        }
        let bodyExpr = match (b.body as Body) {
            case Some(v) => v.decls
            case None => throw Exception("Not Body")
        }
        let funcDeclOfClass = match (bodyExpr[0] as FuncDecl) {
            case Some(v) => v
            case None => throw Exception("Not FuncDecl")
        }
        if (funcDeclOfClass.identifier.value != "init") {
            return 2
        }
        let params = funcDeclOfClass.funcParams
        let params0 = match (params[0].paramType as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (params0 != "Int64") {
            return 3
        }
        let params1 = match (params[1].paramType as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (params1 != "String") {
            return 4
        }
        let namedParam = match (params[1] as FuncParam) {
            case Some(v) => v.not.value
            case None => throw Exception("Not FuncParam")
        }
        if (namedParam != "!") {
            return 4
        }
        let params2 = match (params[2].paramType as FuncType) {
            case Some(v) => v.returnType
            case None => throw Exception("Not FuncType")
        }
        let params2Expr = match (params2 as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (params2Expr != "Int64") {
            return 5
        }
        let params2Lam = match (params[2].expr as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        let params2LamExpr = match (params2Lam as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (params2LamExpr != "1") {
            return 6
        }
        let blockExpr = match (funcDeclOfClass.block as Block) {
            case Some(v) => v.nodes.size
            case None => throw Exception("Not Block")
        }
        if (blockExpr != 0) {
            return 7
        }
        return 0
    }
    return 1
}
