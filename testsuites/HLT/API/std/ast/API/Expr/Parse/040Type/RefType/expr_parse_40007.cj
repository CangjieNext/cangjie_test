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
        a is A<(Int32,String)>
    )
    let expr = parseExpr(input)
    if (expr is IsExpr) {
        var tp = match (expr as IsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not IsExpr")
        }

        if (!(tp is RefType)) {
            return 2
        }

        var aValue = match (tp as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (aValue != "A") {
            return 3
        }

        var iExpr = match (tp as RefType) {
            case Some(v) => v.typeArguments
            case None => throw Exception("Not RefType")
        }
        var ptExpr = match (iExpr[0] as TupleType) {
            case Some(v) => v.types
            case None => throw Exception("Not TupleType")
        }
        var value1 = match (ptExpr[0] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value1 != "Int32") {
            return 4
        }
        return 0
    }
    return 1
}
