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
    var input: Tokens = quote(!a.b)
    let expr = parseExpr(input)
    var b = match (expr as UnaryExpr) {
        case Some(v) => v
        case None => throw Exception("Not UnaryExpr")
    }
    var memExpr = b.expr
    var optValue = b.op.value
    if (optValue != "!") {
        return 1
    }
    if (memExpr is MemberAccess) {
        var b1 = match (memExpr as MemberAccess) {
            case Some(v) => v
            case None => throw Exception("Not MemberAccess")
        }
        var BaseExpr1 = b1.baseExpr
        var dotValue = b1.dot.value
        var fileExpr = b1.field.value

        var baseValue = match (BaseExpr1 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (baseValue != "a") {
            return 1
        }
        if (fileExpr != "b") {
            return 2
        }
        if (dotValue != ".") {
            return 3
        }
        return 0
    }
    return 3
}
