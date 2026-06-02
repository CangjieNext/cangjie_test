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
    var input: Tokens = quote(1.b)
    let expr = parseExpr(input)
    if (expr is MemberAccess) {
        var b = match (expr as MemberAccess) {
            case Some(v) => v
            case None => throw Exception("Not MemberAccess")
        }
        var BaseExpr1 = b.baseExpr
        var dotValue = b.dot.value
        var fileExpr = b.field.value

        var baseValue = match (BaseExpr1 as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        if (baseValue != "1") {
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
