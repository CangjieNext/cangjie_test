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
    var input: Tokens = quote(
         match {
            case true => var a: A = b
            case true => func foo<T>(a:T,b!:Int64=1):Int64 where T<: B {}
         }
    )
    let expr = parseExpr(input)
    if (expr is MatchExpr) {
        var mh = match (expr as MatchExpr) {
            case Some(v) => v
            case None => throw Exception("Not MatchExpr")
        }
        var hasSelector = true
        try {
            mh.selector
        } catch (e: ASTException) {
            hasSelector = false
        }
        var matches0 = mh.matchCases[0]
        var matches1 = mh.matchCases[1]
        var matches0Expr = match (matches0 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches0ExprValue = match (matches0Expr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var mp0 = match (matches0 as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        var mp0Expr = match (mp0 as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mp0DeclExpr = match (mp0Expr as Decl) {
            case Some(v) => v
            case None => throw Exception("Not Decl")
        }
        var mp0VarDeclExpr = match (mp0DeclExpr as VarDecl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarDecl")
        }

        var matches1Expr = match (matches1 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches1ExprValue = match (matches1Expr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var mp1 = match (matches1 as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        var mp1Expr = match (mp1 as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mp1DeclExpr = match (mp1Expr as Decl) {
            case Some(v) => v
            case None => throw Exception("Not Decl")
        }
        var mp1FuncDeclExpr = match (mp1DeclExpr as FuncDecl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not FuncDecl")
        }
        if (hasSelector != false || matches0ExprValue != "true" || !(mp0Expr is Decl) || mp0VarDeclExpr != "a" ||
            matches1ExprValue != "true" || !(mp1Expr is Decl) || mp1FuncDeclExpr != "foo") {
            return 1
        }
        return 0
    }
    return 1
}
