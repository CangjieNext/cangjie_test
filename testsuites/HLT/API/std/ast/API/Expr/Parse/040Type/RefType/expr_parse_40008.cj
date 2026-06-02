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
        a is A<??Int64, ?T>
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
        var ptExpr = match (iExpr[0] as PrefixType) {
            case Some(v) => v.baseType
            case None => throw Exception("Not PrefixType")
        }
        var value1 = match (ptExpr as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value1 != "Int64") {
            return 5
        }

        var ptExpr2 = match (iExpr[1] as PrefixType) {
            case Some(v) => v.baseType
            case None => throw Exception("Not PrefixType")
        }
        var value2 = match (ptExpr2 as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (value2 != "T") {
            return 6
        }
        return 0
    }
    return 1
}
