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
            var a = 2
        }
    )
    let expr = parseDecl(input)
    if (expr is ClassDecl) {
        var b = match (expr as ClassDecl) {
            case Some(v) => v
            case None => throw Exception("Not ClassDecl")
        }
        var bodyExpr = match (b.body as Body) {
            case Some(v) => v.decls[0]
            case None => throw Exception("Not Body")
        }
        var bodyExprValue = match (bodyExpr as VarDecl) {
            case Some(v) => v
            case None => throw Exception("Not VarDecl")
        }
        if (bodyExprValue.identifier.value != "a") {
            return 2
        }
        var bodyExprValue2 = match (bodyExprValue.expr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (bodyExprValue2 != "2") {
            return 3
        }
        return 0
    }
    return 1
}
