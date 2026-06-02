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
    if (expr is ClassDecl) {
        var b = match (expr as ClassDecl) {
            case Some(v) => v
            case None => throw Exception("Not ClassDecl")
        }
        var bodyExpr = match (b.body as Body) {
            case Some(v) => v.decls
            case None => throw Exception("Not Body")
        }
        var funcDeclOfClass = match (bodyExpr[0] as FuncDecl) {
            case Some(v) => v
            case None => throw Exception("Not FuncDecl")
        }
        if (funcDeclOfClass.identifier.value != "init") {
            return 2
        }
        if (funcDeclOfClass.funcParams.size != 0) {
            return 3
        }
        var blockExpr = match (funcDeclOfClass.block as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var blockExpr0 = match (blockExpr[0] as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var blockExpr0Expr = match (blockExpr0 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (blockExpr0Expr != "super") {
            return 5
        }
        var blockExpr1 = match (blockExpr[1] as AssignExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not AssignExpr")
        }
        var blockExpr1Expr = match (blockExpr1 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (blockExpr1Expr != "a") {
            return 6
        }
        var blockExpr2 = match (blockExpr[2] as Decl) {
            case Some(v) => v
            case None => throw Exception("Not Decl")
        }
        var blockExpr2Expr = match (blockExpr2 as VarDecl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarDecl")
        }
        if (blockExpr2Expr != "c") {
            return 7
        }
        var blockExpr3 = match (blockExpr[3] as Decl) {
            case Some(v) => v
            case None => throw Exception("Not Decl")
        }
        var blockExpr3Expr = match (blockExpr3 as FuncDecl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not FuncDecl")
        }
        if (blockExpr3Expr != "foo") {
            return 8
        }

        let funcDeclOfClass2 = match (bodyExpr[1] as FuncDecl) {
            case Some(v) => v
            case None => throw Exception("Not FuncDecl")
        }
        if (funcDeclOfClass2.identifier.value != "init") {
            return 9
        }
        var type0 = match (funcDeclOfClass2.funcParams[0] as FuncParam) {
            case Some(v) => v.paramType
            case None => throw Exception("Not FuncParam")
        }
        var type0Expr = match (type0 as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (type0Expr != "Int64") {
            return 10
        }
        var type1 = match (funcDeclOfClass2.funcParams[1] as FuncParam) {
            case Some(v) => v.paramType
            case None => throw Exception("Not FuncParam")
        }
        var type1Expr = match (type1 as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (type1Expr != "String") {
            return 11
        }
        var notExpr = match (funcDeclOfClass2.funcParams[1] as FuncParam) {
            case Some(v) => v.not.value
            case None => throw Exception("Not FuncParam")
        }
        if (notExpr != "!") {
            return 12
        }
        var typeFunc = match (funcDeclOfClass2.funcParams[2] as FuncParam) {
            case Some(v) => v.paramType
            case None => throw Exception("Not FuncParam")
        }
        var typeFuncExpr = match (typeFunc as FuncType) {
            case Some(v) => v.returnType
            case None => throw Exception("Not FuncType")
        }
        var typeFuncExprValue = match (typeFuncExpr as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (typeFuncExprValue != "Int64") {
            return 13
        }
        var assignLam = match (funcDeclOfClass2.funcParams[2] as FuncParam) {
            case Some(v) => v.expr
            case None => throw Exception("Not FuncParam")
        }
        var assignLamExpr = match (assignLam as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var tassignLamExprValue = match (assignLamExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (tassignLamExprValue != "1") {
            return 14
        }
        var bodysize = match (funcDeclOfClass2.block as Block) {
            case Some(v) => v.nodes.size
            case None => throw Exception("Not Block")
        }
        if (bodysize != 0) {
            return 15
        }
        return 0
    }
    return 1
}
