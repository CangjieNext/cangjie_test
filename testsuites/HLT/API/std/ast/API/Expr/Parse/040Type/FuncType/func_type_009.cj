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
        a is ((((M7_<I1_>)->G1_))->((G2_,G3_)), (((M7_<I1_>)->G1.A<Int64>))->((G2_,G3_)), (((M7_<I1_>)->Int64))->((G2_,G3_)))-> (((M7_<I1_>)->G1_))->((G2_,G3_))
    )
    let expr = parseExpr(input)
    if (expr is IsExpr) {
        var b = match (expr as IsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not IsExpr")
        }

        if (!(b is FuncType)) {
            return 2
        }

        var ft = match (b as FuncType) {
            case Some(v) => v
            case None => throw Exception("Not FuncType")
        }

        var expr0 = match (ft.types[0] as FuncType) {
            case Some(v) => v
            case None => throw Exception("Not FuncType")
        }
        var expr01 = match (expr0.types[0] as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var expr02 = match (expr01 as FuncType) {
            case Some(v) => v.types
            case None => throw Exception("Not FuncType")
        }
        var expr03 = match (expr02[0] as RefType) {
            case Some(v) => v.typeArguments
            case None => throw Exception("Not RefType")
        }
        var value0 = match (expr03[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (value0 != "I1_") {
            return 3
        }

        var expr1 = match (ft.types[1] as FuncType) {
            case Some(v) => v
            case None => throw Exception("Not FuncType")
        }
        var expr11 = match (expr1.types[0] as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var expr12 = match (expr11 as FuncType) {
            case Some(v) => v.returnType
            case None => throw Exception("Not FuncType")
        }
        var value1 = match (expr12 as QualifiedType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not QualifiedType")
        }
        if (value1 != "A") {
            return 4
        }

        var expr2 = match (ft.types[2] as FuncType) {
            case Some(v) => v
            case None => throw Exception("Not FuncType")
        }
        var expr21 = match (expr2.types[0] as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var expr22 = match (expr21 as FuncType) {
            case Some(v) => v.returnType
            case None => throw Exception("Not FuncType")
        }
        var value2 = match (expr22 as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value2 != "Int64") {
            return 5
        }

        var expr3 = match (ft.returnType as FuncType) {
            case Some(v) => v.returnType
            case None => throw Exception("Not FuncType")
        }
        var expr31 = match (expr3 as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var expr32 = match (expr31 as TupleType) {
            case Some(v) => v.types
            case None => throw Exception("Not TupleType")
        }
        var value3 = match (expr32[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (value3 != "G2_") {
            return 6
        }
        return 0
    }
    return 1
}
