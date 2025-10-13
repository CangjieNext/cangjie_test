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
    var input: Tokens = quote(public func foo<T,V>(a:T,b!:Int64=1):Int64{})
    let b = parseDecl(input)
    var expr = match (b as FuncDecl) {
        case Some(v) => v
        case None => throw Exception("Not FuncDecl")
    }

    var value1 = match (expr.modifiers[0] as Modifier) {
        case Some(v) => v.keyword.value
        case None => throw Exception("Not Modifier")
    }
    if (value1 != "public") {
        return 1
    }

    var expr2 = match (expr.funcParams[0] as FuncParam) {
        case Some(v) => v
        case None => throw Exception("Not FuncParam")
    }
    if (expr2.identifier.value != "a") {
        return 2
    }

    var value2 = match (expr2.paramType as RefType) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefType")
    }

    if (value2 != "T") {
        return 3
    }

    var expr3 = match (expr.funcParams[1] as FuncParam) {
        case Some(v) => v
        case None => throw Exception("Not FuncParam")
    }
    var value3 = match (expr3.expr as LitConstExpr) {
        case Some(v) => v.literal.value
        case None => throw Exception("Not LitConstExpr")
    }
    if (value3 != "1") {
        return 4
    }
    var value4 = match (expr3.paramType as PrimitiveType) {
        case Some(v) => v.keyword.value
        case None => throw Exception("Not PrimitiveType")
    }
    if (value4 != "Int64") {
        return 5
    }

    if (expr.identifier.value != "foo") {
        return 6
    }

    var value5 = match (expr.declType as PrimitiveType) {
        case Some(v) => v.keyword.value
        case None => throw Exception("Not PrimitiveType")
    }
    if (value5 != "Int64") {
        return 7
    }

    var block1 = match (expr.block as Block) {
        case Some(v) => v.nodes
        case None => throw Exception("Not Block")
    }
    if (block1.size != 0) {
        return 8
    }

    /*
        return 5
    }
    if (expr.getGeneric().getOrThrow().getConstraints()[0].getType().getIdentifier().value!= "T") {
        return 6
    }
    if (expr.getGeneric().getOrThrow().getConstraints()[0].getUpperBound()[0].asRefType().getIdentifier().value!= "B") {
        return 8
    }
    if (expr.getGeneric().getOrThrow().getConstraints()[1].getType().getIdentifier().value!= "V") {
        return 9
    }
    if (expr.getGeneric().getOrThrow().getConstraints()[1].getUpperBound()[0].asPrimitiveType().getPrimitive().value != "Int64") {
        return 10
    }
     */
    return 0
}
