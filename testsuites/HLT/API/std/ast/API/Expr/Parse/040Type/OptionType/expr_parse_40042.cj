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
        a is ?(C)
    )
    let expr = parseExpr(input)
    if (expr is IsExpr) {
        var tp = match (expr as IsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not IsExpr")
        }

        if (!(tp is PrefixType)) {
            return 2
        }
        var bpExpr = match (tp as PrefixType) {
            case Some(v) => v.baseType
            case None => throw Exception("Not PrefixType")
        }
        var ptExpr = match (bpExpr as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var bpValue = match (ptExpr as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (bpValue != "C") {
            return 3
        }

        var pfExpr = match (tp as PrefixType) {
            case Some(v) => v.prefixOps
            case None => throw Exception("Not PrefixType")
        }

        if (pfExpr.size != Int64(1)) {
            return 4
        }
        return 0
    }
    return 1
}
