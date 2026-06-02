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

main(): Int64 {
    var input: Tokens = quote(
        public struct A<T, V> <: C & I where T<:Int32, V<:C & A {
             A(public var d!: Int64 = 2){
                super()
                a = b
                var c =d
                func foo() {}
             }
             init(a:Int64, b!: String, c!:()->Int64={ => 1}){}
             func foo<T>(a:T):Int64 {}
             public prop b: Int64 {
                get(){
                    return a
                }
                set(v) {
                    a = v
                }
            }
        }
    )
    let expr = parseDecl(input)
    if (expr is StructDecl) {
        var b = match (expr as StructDecl) {
            case Some(v) => v
            case None => throw Exception("Not StructDecl")
        }
        var mod = match (b.modifiers[0] as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        if (mod != "public") {
            return 2
        }
        if (b.keyword.value != "struct") {
            return 3
        }
        if (b.identifier.value != "A") {
            return 4
        }
        let st0 = match (b.superTypes[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (st0 != "C") {
            return 5
        }
        let st1 = match (b.superTypes[1] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (st1 != "I") {
            return 6
        }
        var genericparam = match (b.genericParam as GenericParam) {
            case Some(v) => v.parameters
            case None => throw Exception("Not GenericParam")
        }
        var a = Tokens()
        var aa = a.append(genericparam).toString()
        if (aa != "T V") {
            return 8
        }
        let gc0 = match (b.genericConstraint[0] as GenericConstraint) {
            case Some(v) => v
            case None => throw Exception("Not GenericConstraint")
        }
        let gc0Type = match (gc0.typeArgument as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (gc0Type != "T") {
            return 9
        }
        let gc0Upper = match (gc0.upperBounds[0] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (gc0Upper != "Int32") {
            return 10
        }
        let gc1 = match (b.genericConstraint[1] as GenericConstraint) {
            case Some(v) => v
            case None => throw Exception("Not GenericConstraint")
        }
        let gc1Upper0 = match (gc1.upperBounds[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (gc1Upper0 != "C") {
            return 11
        }
        let gc1Upper1 = match (gc1.upperBounds[1] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (gc1Upper1 != "A") {
            return 12
        }

        var bodyExpr0 = match (b.body as Body) {
            case Some(v) => v.decls[0]
            case None => throw Exception("Not Body")
        }
        let ctorDeclOfRecord = match (bodyExpr0 as PrimaryCtorDecl) {
            case Some(v) => v
            case None => throw Exception("Not PrimaryCtorDecl")
        }
        if (ctorDeclOfRecord.identifier.value != "A") {
            return 22
        }
        let params0 = match (ctorDeclOfRecord.funcParams[0] as FuncParam) {
            case Some(v) => v
            case None => throw Exception("Not FuncParam")
        }
        if (params0.not.value != "!") {
            return 23
        }
        if (params0.identifier.value != "d") {
            return 24
        }
        let params0Type = match (params0.expr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (params0Type != "2") {
            return 25
        }

        var blockExpr = match (ctorDeclOfRecord.block as Block) {
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
            return 26
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
            return 27
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
            return 28
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
            return 29
        }
        var bodyExpr1 = match (b.body as Body) {
            case Some(v) => v.decls[1]
            case None => throw Exception("Not Body")
        }
        let funcDeclOfRecord = match (bodyExpr1 as FuncDecl) {
            case Some(v) => v
            case None => throw Exception("Not FuncDecl")
        }
        if (funcDeclOfRecord.identifier.value != "init") {
            return 32
        }
        let params = funcDeclOfRecord.funcParams
        let params00 = match (params[0].paramType as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (params00 != "Int64") {
            return 33
        }
        let params1 = match (params[1].paramType as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (params1 != "String") {
            return 34
        }
        let namedParam = match (params[1] as FuncParam) {
            case Some(v) => v.not.value
            case None => throw Exception("Not FuncParam")
        }
        if (namedParam != "!") {
            return 34
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
            return 35
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
            return 36
        }
        let blockExpr4 = match (funcDeclOfRecord.block as Block) {
            case Some(v) => v.nodes.size
            case None => throw Exception("Not Block")
        }
        if (blockExpr4 != 0) {
            return 37
        }
        var bodyExpr2 = match (b.body as Body) {
            case Some(v) => v.decls[2]
            case None => throw Exception("Not Body")
        }
        let funcDeclOfRecord2 = match (bodyExpr2 as FuncDecl) {
            case Some(v) => v
            case None => throw Exception("Not FuncDecl")
        }
        if (funcDeclOfRecord2.identifier.value != "foo") {
            return 42
        }
        let typeExpr2 = match (funcDeclOfRecord2.declType as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (typeExpr2 != "Int64") {
            return 43
        }
        let block2Size = match (funcDeclOfRecord2.block as Block) {
            case Some(v) => v.nodes.size
            case None => throw Exception("Not Block")
        }
        if (block2Size != 0) {
            return 44
        }
        var bodyExpr3 = match (b.body as Body) {
            case Some(v) => v.decls[3]
            case None => throw Exception("Not Body")
        }
        let propDeclOfClass = match (bodyExpr3 as PropDecl) {
            case Some(v) => v
            case None => throw Exception("Not PropDecl")
        }
        let mod3 = match (propDeclOfClass.modifiers[0] as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        if (mod3 != "public") {
            return 55
        }
        if (propDeclOfClass.identifier.value != "b") {
            return 56
        }
        return 0
    }
    return 1
}
