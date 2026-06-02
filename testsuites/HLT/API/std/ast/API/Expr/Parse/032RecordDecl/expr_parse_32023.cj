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
        public struct A<T, V> <: C & I where T<:Int32, V<:C & A {
             init(){
                super()
                a = b
                var c =d
                func foo() {}
             }
             init(a:Int64, b!: String, c!:()->Int64={=> 1}){}
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
        let funcDeclOfRecord = match (bodyExpr0 as FuncDecl) {
            case Some(v) => v
            case None => throw Exception("Not FuncDecl")
        }
        if (funcDeclOfRecord.identifier.value != "init") {
            return 2
        }
        if (funcDeclOfRecord.funcParams.size != 0) {
            return 3
        }
        var blockExpr = match (funcDeclOfRecord.block as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var blockExpr0 = match (blockExpr[0] as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var blockExpr0Value = match (blockExpr0 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (blockExpr0Value != "super") {
            return 5
        }
        var blockExpr1 = match (blockExpr[1] as AssignExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not AssignExpr")
        }
        var blockExpr1Value = match (blockExpr1 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (blockExpr1Value != "a") {
            return 6
        }
        var blockExpr2 = match (blockExpr[2] as Decl) {
            case Some(v) => v
            case None => throw Exception("Not Decl")
        }
        var blockExpr2Value = match (blockExpr2 as VarDecl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarDecl")
        }
        if (blockExpr2Value != "c") {
            return 7
        }
        var blockExpr3 = match (blockExpr[3] as Decl) {
            case Some(v) => v
            case None => throw Exception("Not Decl")
        }
        var blockExpr3Value = match (blockExpr3 as FuncDecl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not FuncDecl")
        }
        if (blockExpr3Value != "foo") {
            return 8
        }
        var bodyExpr1 = match (b.body as Body) {
            case Some(v) => v.decls[1]
            case None => throw Exception("Not Body")
        }
        let funcDeclOfRecord2 = match (bodyExpr1 as FuncDecl) {
            case Some(v) => v
            case None => throw Exception("Not FuncDecl")
        }
        if (funcDeclOfRecord2.identifier.value != "init") {
            return 9
        }
        let params0 = match (funcDeclOfRecord2.funcParams[0] as FuncParam) {
            case Some(v) => v
            case None => throw Exception("Not FuncParam")
        }
        let p0type = match (params0.paramType as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (p0type != "Int64") {
            return 10
        }
        let params1 = match (funcDeclOfRecord2.funcParams[1] as FuncParam) {
            case Some(v) => v
            case None => throw Exception("Not FuncParam")
        }
        let p1type = match (params1.paramType as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (p1type != "String") {
            return 11
        }
        if (params1.not.value != "!") {
            return 4
        }
        let params2 = match (funcDeclOfRecord2.funcParams[2] as FuncParam) {
            case Some(v) => v
            case None => throw Exception("Not FuncParam")
        }
        let p2type = match (params2.paramType as FuncType) {
            case Some(v) => v.returnType
            case None => throw Exception("Not FuncType")
        }
        let p2typeExpr = match (p2type as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (p2typeExpr != "Int64") {
            return 12
        }
        let p2Lam = match (params2.expr as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        let p2LamExpr = match (p2Lam as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (p2LamExpr != "1") {
            return 13
        }
        let blockExpr4 = match (funcDeclOfRecord2.block as Block) {
            case Some(v) => v.nodes.size
            case None => throw Exception("Not Block")
        }
        if (blockExpr4 != 0) {
            return 15
        }
        return 0
    }
    return 1
}
