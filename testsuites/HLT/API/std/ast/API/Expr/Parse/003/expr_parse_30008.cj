/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    var input: Tokens = quote(!a.b)
    let expr = parseExpr(input)
    if (expr is UnaryExpr) {
        var b = match (expr as UnaryExpr) {
            case Some(v) => v
            case None => throw Exception("Not UnaryExpr")
        }

        var unaryExpr = b.expr
        var optVaule = b.op.value

        var baseExpr = match (unaryExpr as MemberAccess) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not MemberAccess")
        }

        var baseValue = match (baseExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var fieldValue = match (unaryExpr as MemberAccess) {
            case Some(v) => v.field.value
            case None => throw Exception("Not MemberAccess")
        }

        var dotValue = match (unaryExpr as MemberAccess) {
            case Some(v) => v.dot.value
            case None => throw Exception("Not MemberAccess")
        }

        if (dotValue != "." || fieldValue != "b" || baseValue != "a" || optVaule != "!") {
            return 1
        }

        return 0
    }
    return 3
}
