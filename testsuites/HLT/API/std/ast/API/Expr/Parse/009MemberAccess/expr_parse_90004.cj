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
    var input: Tokens = quote(a.b.c.d)
    let expr = parseExpr(input)
    if (expr is MemberAccess) {
        var b = match (expr as MemberAccess) {
            case Some(v) => v
            case None => throw Exception("Not MemberAccess")
        }
        var BaseExpr3 = b.baseExpr
        var dotValue3 = b.dot.value
        var fileValue4 = b.field.value

        if (dotValue3 != "." || fileValue4 != "d") {
            return 3
        }

        var b3 = match (BaseExpr3 as MemberAccess) {
            case Some(v) => v
            case None => throw Exception("Not MemberAccess")
        }
        var BaseExpr2 = b3.baseExpr
        var dotValue2 = b3.dot.value
        var fileValue3 = b3.field.value

        if (dotValue2 != "." || fileValue3 != "c") {
            return 2
        }

        var b2 = match (BaseExpr2 as MemberAccess) {
            case Some(v) => v
            case None => throw Exception("Not MemberAccess")
        }
        var BaseExpr1 = b2.baseExpr
        var baseValue = match (BaseExpr1 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var dotValue1 = b2.dot.value
        var fileValue2 = b2.field.value

        if (dotValue1 != "." || fileValue2 != "b" || baseValue != "a") {
            return 1
        }
        return 0
    }
    return 3
}
