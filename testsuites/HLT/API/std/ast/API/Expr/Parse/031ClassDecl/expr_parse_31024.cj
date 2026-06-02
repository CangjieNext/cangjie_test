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
             A(a:Int64){
                super()
                a = b
                var c =d
                func foo() {}
             }
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
        var ctorDeclOfClass = match (bodyExpr[0] as PrimaryCtorDecl) {
            case Some(v) => v
            case None => throw Exception("Not PrimaryCtorDecl")
        }
        if (ctorDeclOfClass.identifier.value != "A") {
            return 2
        }
        var paramList = match (ctorDeclOfClass.funcParams[0] as FuncParam) {
            case Some(v) => v
            case None => throw Exception("Not FuncParam")
        }
        if (paramList.identifier.value != "a") {
            return 3
        }
        var typeExpr = match (paramList.paramType as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (typeExpr != "Int64") {
            return 4
        }
        var blockExpr = match (ctorDeclOfClass.block as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        var callExpr = match (blockExpr[0] as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var callExprValue = match (callExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (callExprValue != "super") {
            return 5
        }
        var assignLeft = match (blockExpr[1] as AssignExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not AssignExpr")
        }
        var assignLeftValue = match (assignLeft as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (assignLeftValue != "a") {
            return 6
        }
        var declExpr = match (blockExpr[2] as Decl) {
            case Some(v) => v
            case None => throw Exception("Not Decl")
        }
        var declExprValue = match (declExpr as VarDecl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarDecl")
        }
        if (declExprValue != "c") {
            return 7
        }
        var funcExpr = match (blockExpr[3] as Decl) {
            case Some(v) => v
            case None => throw Exception("Not Decl")
        }
        var funcExprValue = match (funcExpr as FuncDecl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not FuncDecl")
        }
        if (funcExprValue != "foo") {
            return 8
        }
        return 0
    }
    return 1
}
