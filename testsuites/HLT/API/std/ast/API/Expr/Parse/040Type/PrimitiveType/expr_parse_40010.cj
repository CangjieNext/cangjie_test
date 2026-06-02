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

// all of PrimitiveType
main(): Int64 {
    var input: Tokens = quote(
        a is (Int8,Int16,Int32,Int64,UInt8,UInt16,UInt32,UInt64,Float16,Float32,Float64,Rune,Bool,Unit)
    )
    let expr = parseExpr(input)
    if (expr is IsExpr) {
        var tp = match (expr as IsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not IsExpr")
        }

        if (!(tp is TupleType)) {
            return 2
        }

        var ttExpr = match (tp as TupleType) {
            case Some(v) => v.types
            case None => throw Exception("Not StructDecl")
        }
        var value0 = match (ttExpr[0] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value0 != "Int8") {
            return 3
        }

        var value1 = match (ttExpr[1] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value1 != "Int16") {
            return 3
        }

        var value2 = match (ttExpr[2] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value2 != "Int32") {
            return 5
        }

        var value3 = match (ttExpr[3] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value3 != "Int64") {
            return 6
        }

        var value4 = match (ttExpr[4] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value4 != "UInt8") {
            return 7
        }

        var value5 = match (ttExpr[5] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value5 != "UInt16") {
            return 8
        }

        var value6 = match (ttExpr[6] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value6 != "UInt32") {
            return 9
        }

        var value7 = match (ttExpr[7] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value7 != "UInt64") {
            return 10
        }

        var value8 = match (ttExpr[8] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value8 != "Float16") {
            return 11
        }

        var value9 = match (ttExpr[9] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value9 != "Float32") {
            return 12
        }

        var value10 = match (ttExpr[10] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value10 != "Float64") {
            return 13
        }

        var value11 = match (ttExpr[11] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value11 != "Rune") {
            return 14
        }

        var value12 = match (ttExpr[12] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value12 != "Bool") {
            return 15
        }

        var value13 = match (ttExpr[13] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value13 != "Unit") {
            return 15
        }

        return 0
    }
    return 1
}
