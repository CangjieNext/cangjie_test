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
        extend<K> A<K> <: C & ?A & p.A<Int64> {
            public func foo<T>(a:T,b!:Int64=1):Int64 where T<: B {}
        }
    )
    let expr = parseDecl(input)
    if (expr is ExtendDecl) {
        var ex = match (expr as ExtendDecl) {
            case Some(v) => v
            case None => throw Exception("Not ExtendDecl")
        }
        if (ex.keyword.value != "extend") {
            return 2
        }
        var typeExpr = match (ex.extendType as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (typeExpr != "A") {
            return 3
        }
        var es0 = match (ex.superTypes[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (es0 != "C") {
            return 4
        }
        var es1 = match (ex.superTypes[1] as PrefixType) {
            case Some(v) => v.baseType
            case None => throw Exception("Not PrefixType")
        }
        var es1Expr = match (es1 as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (es1Expr != "A") {
            return 5
        }
        var es2 = match (ex.superTypes[2] as QualifiedType) {
            case Some(v) => v.baseType
            case None => throw Exception("Not QualifiedType")
        }
        var es2Expr = match (es2 as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (es2Expr != "p") {
            return 6
        }
        var eb = match (ex.body as Body) {
            case Some(v) => v.decls[0]
            case None => throw Exception("Not Body")
        }
        var ebExpr = match (eb as FuncDecl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not FuncDecl")
        }
        if (ebExpr != "foo") {
            return 7
        }

        if (ex.genericConstraint.size != 0) {
            return 8
        }
        return 0
    }
    return 1
}
