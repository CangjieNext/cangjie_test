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

main() {
    var input: Tokens = quote(a[0].b)
    let expr = parseExpr(input)
    if (expr is MemberAccess) {
        var b = match (expr as MemberAccess) {
            case Some(v) => v
            case None => throw Exception("Not MemberAccess")
        }

        var subExpr = match (b.baseExpr as SubscriptExpr) {
            case Some(v) => v
            case None => throw Exception("Not SubscriptExpr")
        }
        var lValue = subExpr.lSquare.value
        var rValue = subExpr.rSquare.value

        var aExpr = subExpr.baseExpr
        var aValue = match (aExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var ExprList = subExpr.indexList
        var value0 = ""
        for (i in ExprList) {
            var value = match (i as LitConstExpr) {
                case Some(v) => v.literal.value
                case None => throw Exception("Not LitConstExpr")
            }
            value0 = value0 + value
        }

        if (value0 != "0" || lValue != "[" || rValue != "]" || aValue != "a") {
            return 1
        }

        var dotValue = b.dot.value
        if (dotValue != ".") {
            return 2
        }

        var fileValue = b.field.value
        if (fileValue != "b") {
            return 3
        }
        return 0
    }
    return 4
}
