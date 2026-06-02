/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ParseASTException
// ASSERT: scan parsing decl error

import std.ast.*

main(): Int64 {
    var input: Tokens = quote(
        interface A<T, V> <: C & I where T<:Int32, V<:C & A {
            operator func foo +(a: Int64): Int64 {}
        }
    )
    let expr = parseDecl(input)
    if (expr is InterfaceDecl) {
        var b = match (expr as InterfaceDecl) {
            case Some(v) => v
            case None => throw Exception("Not InterfaceDecl")
        }
        var bodyExpr = match (b.body as Body) {
            case Some(v) => v.decls[0]
            case None => throw Exception("Not Body")
        }
        let funcDeclOfInterface = match (bodyExpr as FuncDecl) {
            case Some(v) => v
            case None => throw Exception("Not FuncDecl")
        }
        if (funcDeclOfInterface.identifier.value != "+") {
            return 2
        }
        let funcPrimit = match (funcDeclOfInterface.declType as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (funcPrimit != "Int64") {
            return 3
        }
        var blockSize = match (funcDeclOfInterface.block as Block) {
            case Some(v) => v.nodes.size
            case None => throw Exception("Not Block")
        }
        if (blockSize != 0) {
            return 4
        }
        return 0
    }
    return 1
}
