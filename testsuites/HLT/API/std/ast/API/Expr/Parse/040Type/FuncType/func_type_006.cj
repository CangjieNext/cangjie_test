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
        a is (?Int64, ??A)->???p.A<Int64>
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

        var expr0 = match (ft.types[0] as PrefixType) {
            case Some(v) => v.baseType
            case None => throw Exception("Not PrefixType")
        }
        var value0 = match (expr0 as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value0 != "Int64") {
            return 3
        }

        var expr1 = match (ft.types[1] as PrefixType) {
            case Some(v) => v.baseType
            case None => throw Exception("Not PrefixType")
        }
        var value1 = match (expr1 as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (value1 != "A") {
            return 4
        }

        var expr2 = match (ft.returnType as PrefixType) {
            case Some(v) => v.baseType
            case None => throw Exception("Not PrefixType")
        }
        var value2 = match (expr2 as QualifiedType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not QualifiedType")
        }
        if (value2 != "A") {
            return 5
        }

        return 0
    }
    return 1
}
