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
        if (false) {
             func foo<T1,T2>(a: T1){}
        } else {
             func foo<T1>(a: T1)where T1 <: Int32{}
        }
    )
    let expr = parseExpr(input)
    if (expr is IfExpr) {
        var b = match (expr as IfExpr) {
            case Some(v) => v
            case None => throw Exception("Not IfExpr")
        }
        var condExpr = match (b.condition as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (condExpr != "false") {
            return 1
        }
        var ifblock = match (b.ifBlock as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var ifblockExpr = match (ifblock as FuncDecl) {
            case Some(v) => v.genericParam
            case None => throw Exception("Not FuncDecl")
        }
        var ifblockExprge = match (ifblockExpr as GenericParam) {
            case Some(v) => v.parameters
            case None => throw Exception("Not GenericParam")
        }
        var a = Tokens()
        var aa = a.append(ifblockExprge).toString()
        if (aa != "T1 T2") {
            return 2
        }
        var elseblock = match (b.elseExpr as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var elseblockDecl = match (elseblock as Decl) {
            case Some(v) => v
            case None => throw Exception("Not Decl")
        }
        var elseblockFuncDecl = match (elseblockDecl as FuncDecl) {
            case Some(v) => v
            case None => throw Exception("Not FuncDecl")
        }
        var elseblockFuncDeclExpr = match (elseblockFuncDecl.genericConstraint[0] as GenericConstraint) {
            case Some(v) => v.typeArgument
            case None => throw Exception("Not GenericConstraint")
        }
        var elseblockFuncDeclExprValue = match (elseblockFuncDeclExpr as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (elseblockFuncDeclExprValue != "T1") {
            return 3
        }

        return 0
    }
    return 4
}
