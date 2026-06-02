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
        public open class A<T, V> <: C & I where T<:Int32, V<:C & A {}
    )
    let expr = parseDecl(input)
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
    var superExpr0 = match (b.superTypes[0] as RefType) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefType")
    }
    if (superExpr0 != "C") {
        return 5
    }
    var superExpr1 = match (b.superTypes[1] as RefType) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefType")
    }
    if (superExpr1 != "I") {
        return 6
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
    var a = Tokens()
    var aa = a.append(genericparam).toString()
    if (aa != "T V") {
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
    var genericConstType0 = match (b.genericConstraint[1] as GenericConstraint) {
        case Some(v) => v.upperBounds[0]
        case None => throw Exception("Not GenericConstraint")
    }
    var genericConstType0Expr = match (genericConstType0 as RefType) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefType")
    }
    if (genericConstType0Expr != "C") {
        return 11
    }
    var genericConstType1 = match (b.genericConstraint[1] as GenericConstraint) {
        case Some(v) => v.upperBounds[1]
        case None => throw Exception("Not GenericConstraint")
    }
    var genericConstType1Expr = match (genericConstType1 as RefType) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefType")
    }
    if (genericConstType1Expr != "A") {
        return 12
    }

    return 0
}
