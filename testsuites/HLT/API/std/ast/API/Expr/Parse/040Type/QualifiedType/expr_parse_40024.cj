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
        a is pkgs.A
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

        var qtExpr = match (tp as QualifiedType) {
            case Some(v) => v
            case None => throw Exception("Not QualifiedType")
        }
        var value0 = match (qtExpr.baseType as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (value0 != "pkgs") {
            return 3
        }

        var value1 = match (tp as QualifiedType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not QualifiedType")
        }
        if (value1 != "A") {
            return 4
        }
        return 0
    }
    return 1
}
