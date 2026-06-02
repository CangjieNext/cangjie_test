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
        extend<T> A<T> <: C & ?A & p.A<Int64> where T<: Int32, V<: p.C & Array<A> & ()->Unit {
            public func foo<T>(a:T,b!:Int64=1):Int64 where T<: B {}
        }
    )
    let expr = parseDecl(input)
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
    var eb = match (ex.body as Body) {
        case Some(v) => v.decls[0]
        case None => throw Exception("Not Body")
    }
    var ebExpr = match (eb as FuncDecl) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not FuncDecl")
    }
    if (ebExpr != "foo") {
        return 4
    }
    var egc0type = match (ex.genericConstraint[0] as GenericConstraint) {
        case Some(v) => v.typeArgument
        case None => throw Exception("Not GenericConstraint")
    }
    var egc0typeValue = match (egc0type as RefType) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefType")
    }
    if (egc0typeValue != "T") {
        return 5
    }
    var egc0Upper = match (ex.genericConstraint[0] as GenericConstraint) {
        case Some(v) => v.upperBounds[0]
        case None => throw Exception("Not GenericConstraint")
    }
    var egc0UpperValue = match (egc0Upper as PrimitiveType) {
        case Some(v) => v.keyword.value
        case None => throw Exception("Not PrimitiveType")
    }
    if (egc0UpperValue != "Int32") {
        return 6
    }
    var egc1type = match (ex.genericConstraint[1] as GenericConstraint) {
        case Some(v) => v.typeArgument
        case None => throw Exception("Not GenericConstraint")
    }
    var egc1typeValue = match (egc1type as RefType) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefType")
    }
    if (egc1typeValue != "V") {
        return 7
    }
    var egc1Upper0 = match (ex.genericConstraint[1] as GenericConstraint) {
        case Some(v) => v.upperBounds[0]
        case None => throw Exception("Not GenericConstraint")
    }
    var egc1Upper0Expr = match (egc1Upper0 as QualifiedType) {
        case Some(v) => v.baseType
        case None => throw Exception("Not QualifiedType")
    }
    var egc1Upper0ExprValue = match (egc1Upper0Expr as RefType) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefType")
    }
    if (egc1Upper0ExprValue != "p") {
        return 8
    }
    var egc1Upper1 = match (ex.genericConstraint[1] as GenericConstraint) {
        case Some(v) => v.upperBounds[1]
        case None => throw Exception("Not GenericConstraint")
    }
    var egc1Upper1Expr = match (egc1Upper1 as RefType) {
        case Some(v) => v.typeArguments[0]
        case None => throw Exception("Not RefType")
    }
    var egc1Upper1ExprValue = match (egc1Upper1Expr as RefType) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefType")
    }
    if (egc1Upper1ExprValue != "A") {
        return 9
    }
    var egc1Upper2 = match (ex.genericConstraint[1] as GenericConstraint) {
        case Some(v) => v.upperBounds[2]
        case None => throw Exception("Not GenericConstraint")
    }
    var egc1Upper2Expr = match (egc1Upper2 as FuncType) {
        case Some(v) => v.returnType
        case None => throw Exception("Not FuncType")
    }
    var egc1Upper2ExprValue = match (egc1Upper2Expr as PrimitiveType) {
        case Some(v) => v.keyword.value
        case None => throw Exception("Not PrimitiveType")
    }
    if (egc1Upper2ExprValue != "Unit") {
        return 10
    }
    if (ex.genericConstraint.size == 0) {
        return 11
    }
    var es0 = match (ex.superTypes[0] as RefType) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefType")
    }
    if (es0 != "C") {
        return 12
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
        return 13
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
        return 15
    }
    return 0
}
