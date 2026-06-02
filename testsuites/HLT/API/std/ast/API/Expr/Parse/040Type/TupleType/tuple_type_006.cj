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
        a is ((Int64),(A))
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
            case None => throw Exception("Not TupleType")
        }
        var expr0 = match (ttExpr[0] as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var value0 = match (expr0 as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (value0 != "Int64") {
            return 3
        }

        var expr1 = match (ttExpr[1] as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var value1 = match (expr1 as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (value1 != "A") {
            return 3
        }
        return 0
    }
    return 1
}
