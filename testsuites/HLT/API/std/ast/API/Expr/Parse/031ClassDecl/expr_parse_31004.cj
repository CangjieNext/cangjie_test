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
        public open class A<T> <: C where T<:Int32 {}
    )
    let expr = parseDecl(input)
    if (expr is ClassDecl) {
        var b = match (expr as ClassDecl) {
            case Some(v) => v
            case None => throw Exception("Not ClassDecl")
        }
        var modifier = b.modifiers
        var modifier0 = match (modifier[0] as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        var modifier1 = match (modifier[1] as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        if (modifier0 != "public" || modifier1 != "open") {
            return 2
        }
        var keywordExpr = b.keyword.value
        if (keywordExpr != "class") {
            return 3
        }
        var identExpr = b.identifier.value
        if (identExpr != "A") {
            return 4
        }
        var superExpr = match (b.superTypes[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (superExpr != "C") {
            return 5
        }
        var bodyExpr = match (b.body as Body) {
            case Some(v) => v.decls.size
            case None => throw Exception("Not Body")
        }
        if (bodyExpr != 0) {
            return 7
        }
        var genericparam = match (b.genericParam as GenericParam) {
            case Some(v) => v.parameters
            case None => throw Exception("Not GenericParam")
        }
        if (genericparam.toString() != "T") {
            return 8
        }
        var genericConst = match (b.genericConstraint[0] as GenericConstraint) {
            case Some(v) => v.typeArgument
            case None => throw Exception("Not GenericConstraint")
        }
        var genericConstExpr = match (genericConst as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (genericConstExpr != "T") {
            return 9
        }
        var genericConstType = match (b.genericConstraint[0] as GenericConstraint) {
            case Some(v) => v.upperBounds[0]
            case None => throw Exception("Not GenericConstraint")
        }
        var genericConstTypeExpr = match (genericConstType as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (genericConstTypeExpr != "Int32") {
            return 10
        }
        return 0
    }
    return 1
}
