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

main() {
    var input: Tokens = quote(
        static let (a,b): (Int32,Rune) = (1,'a')
    )
    let expr = parseDecl(input)
    var b = match (expr as VarDecl) {
        case Some(v) => v
        case None => throw Exception("Not VarDecl")
    }
    var modifier = b.modifiers[0]
    var modifiersExpr = match (modifier as Modifier) {
        case Some(v) => v.keyword.value
        case None => throw Exception("Not Modifier")
    }
    var typeExpr = b.keyword.value
    var tp = b.pattern
    var tp0 = match (tp as TuplePattern) {
        case Some(v) => v.patterns[0]
        case None => throw Exception("Not TuplePattern")
    }
    var tp0Expr = match (tp0 as VarPattern) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not VarPattern")
    }
    var tp1 = match (tp as TuplePattern) {
        case Some(v) => v.patterns[1]
        case None => throw Exception("Not TuplePattern")
    }
    var tp1Expr = match (tp1 as VarPattern) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not VarPattern")
    }
    var dt = b.declType
    var dt0 = match (dt as TupleType) {
        case Some(v) => v.types[0]
        case None => throw Exception("Not TupleType")
    }
    var dt0Expr = match (dt0 as PrimitiveType) {
        case Some(v) => v.keyword.value
        case None => throw Exception("Not PrimitiveType")
    }
    var dt1 = match (dt as TupleType) {
        case Some(v) => v.types[1]
        case None => throw Exception("Not TupleType")
    }
    var dt1Expr = match (dt1 as PrimitiveType) {
        case Some(v) => v.keyword.value
        case None => throw Exception("Not PrimitiveType")
    }
    var e = b.expr
    var e0 = match (e as TupleLiteral) {
        case Some(v) => v.elements[0]
        case None => throw Exception("Not TupleLiteral")
    }
    var e0Expr = match (e0 as LitConstExpr) {
        case Some(v) => v.literal.value
        case None => throw Exception("Not LitConstExpr")
    }
    var e1 = match (e as TupleLiteral) {
        case Some(v) => v.elements[1]
        case None => throw Exception("Not TupleLiteral")
    }
    var e1Expr = match (e1 as LitConstExpr) {
        case Some(v) => v.literal.value
        case None => throw Exception("Not LitConstExpr")
    }
    if (modifiersExpr != "static" || typeExpr != "let" || tp0Expr != "a" || tp1Expr != "b" || dt0Expr != "Int32" ||
        dt1Expr != "Rune" || e0Expr != "1" || e1Expr != "a") {
        return 1
    }
    return 0
}
