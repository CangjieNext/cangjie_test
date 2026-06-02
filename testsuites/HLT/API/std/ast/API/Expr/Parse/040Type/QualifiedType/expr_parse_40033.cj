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
        a is A.B<String, Int32, (C), c.d<Int64>, ????In64, (In64,String)>
    )
    let expr = parseExpr(input)
    if (expr is IsExpr) {
        var tp = match (expr as IsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not StructDecl")
        }

        if (!(tp is QualifiedType)) {
            return 2
        }

        var btExpr = match (tp as QualifiedType) {
            case Some(v) => v.baseType
            case None => throw Exception("Not QualifiedType")
        }
        var aValue = match (btExpr as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (aValue != "A") {
            return 3
        }

        var bValue = match (tp as QualifiedType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not QualifiedType")
        }
        if (bValue != "B") {
            return 4
        }

        var taExpr = match (tp as QualifiedType) {
            case Some(v) => v.typeArguments
            case None => throw Exception("Not QualifiedType")
        }
        var sValue = match (taExpr[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (sValue != "String") {
            return 6
        }

        var i32Value = match (taExpr[1] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (i32Value != "Int32") {
            return 7
        }

        var ptExpr = match (taExpr[2] as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var cValue = match (ptExpr as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (cValue != "C") {
            return 8
        }

        var qtExpr1 = match (taExpr[3] as QualifiedType) {
            case Some(v) => v.typeArguments
            case None => throw Exception("Not QualifiedType")
        }
        var value1 = match (qtExpr1[0] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value1 != "Int64") {
            return 9
        }

        var qtExpr2 = match (taExpr[4] as PrefixType) {
            case Some(v) => v.prefixOps
            case None => throw Exception("Not PrefixType")
        }
        if (qtExpr2.size != Int64(4)) {
            return 10
        }

        var qtExpr3 = match (taExpr[5] as TupleType) {
            case Some(v) => v.types
            case None => throw Exception("Not TupleType")
        }
        var value3 = match (qtExpr3[1] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (value3 != "String") {
            return 11
        }

        return 0
    }
    return 1
}
