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
        a is A.B<Int64>
    )
    let expr = parseExpr(input)
    if (expr is IsExpr) {
        var tp = match (expr as IsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not IsExpr")
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
        var value = match (taExpr[0] as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value != "Int64") {
            return 6
        }
        return 0
    }
    return 1
}
