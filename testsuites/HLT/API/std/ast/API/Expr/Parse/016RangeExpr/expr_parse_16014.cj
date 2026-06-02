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
    var input: Tokens = quote(a[b]..=b[c]:c[1])
    let expr = parseExpr(input)
    if (expr is RangeExpr) {
        var b = match (expr as RangeExpr) {
            case Some(v) => v
            case None => throw Exception("Not RangeExpr")
        }
        var startExpr = match (b.start as SubscriptExpr) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not SubscriptExpr")
        }

        var aValue = match (startExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var endExpr = match (b.end as SubscriptExpr) {
            case Some(v) => v.indexList
            case None => throw Exception("Not SubscriptExpr")
        }

        var cValue = match (endExpr[0] as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var stepExpr = match (b.step as SubscriptExpr) {
            case Some(v) => v
            case None => throw Exception("Not SubscriptExpr")
        }

        if (aValue != "a" || cValue != "c") {
            return 1
        }
        return 0
    }
    return 5
}
