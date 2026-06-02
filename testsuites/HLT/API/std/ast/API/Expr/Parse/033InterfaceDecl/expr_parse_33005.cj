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
        public interface A<T, V> <: C & I where T<:Int32, V<:C & A {}
    )
    let expr = parseDecl(input)
    if (expr is InterfaceDecl) {
        var b = match (expr as InterfaceDecl) {
            case Some(v) => v
            case None => throw Exception("Not InterfaceDecl")
        }
        var mod = match (b.modifiers[0] as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        if (mod != "public") {
            return 2
        }
        if (b.keyword.value != "interface") {
            return 3
        }
        if (b.identifier.value != "A") {
            return 4
        }
        var st0 = match (b.superTypes[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (st0 != "C") {
            return 5
        }
        var st1 = match (b.superTypes[1] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (st1 != "I") {
            return 6
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
        var a = Tokens()
        var aa = a.append(gp).toString()
        if (aa != "T V") {
            return 8
        }

        let gc0 = match (b.genericConstraint[0] as GenericConstraint) {
            case Some(v) => v
            case None => throw Exception("Not GenericConstraint")
        }
        let gc0Type = match (gc0.typeArgument as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (gc0Type != "T") {
            return 9
        }
        let gc0Upper = match (gc0.upperBounds[0] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (gc0Upper != "Int32") {
            return 10
        }
        let gc1 = match (b.genericConstraint[1] as GenericConstraint) {
            case Some(v) => v
            case None => throw Exception("Not GenericConstraint")
        }
        let gc1Upper0 = match (gc1.upperBounds[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (gc1Upper0 != "C") {
            return 11
        }
        let gc1Upper1 = match (gc1.upperBounds[1] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (gc1Upper1 != "A") {
            return 12
        }

        return 0
    }
    return 1
}
