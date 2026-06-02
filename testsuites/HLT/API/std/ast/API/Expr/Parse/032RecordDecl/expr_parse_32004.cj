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
        public struct A<T> <: C where T<:Int32 {}
    )
    let expr = parseDecl(input)
    if (expr is StructDecl) {
        var b = match (expr as StructDecl) {
            case Some(v) => v
            case None => throw Exception("Not StructDecl")
        }
        var mod = match (b.modifiers[0] as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        if (mod != "public") {
            return 2
        }
        if (b.keyword.value != "struct") {
            return 3
        }
        if (b.identifier.value != "A") {
            return 4
        }
        var st = match (b.superTypes[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (st != "C") {
            return 5
        }
        var bodySize = match (b.body as Body) {
            case Some(v) => v.decls.size
            case None => throw Exception("Not Body")
        }
        if (bodySize != 0) {
            return 7
        }
        var gp = match (b.genericParam as GenericParam) {
            case Some(v) => v.parameters
            case None => throw Exception("Not GenericParam")
        }
        if (gp.toString() != "T") {
            return 8
        }
        var gc = match (b.genericConstraint[0] as GenericConstraint) {
            case Some(v) => v
            case None => throw Exception("Not GenericConstraint")
        }
        var typeExpr = match (gc.typeArgument as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (typeExpr != "T") {
            return 9
        }
        var upper = match (gc.upperBounds[0] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (upper != "Int32") {
            return 10
        }
        return 0
    }
    return 1
}
