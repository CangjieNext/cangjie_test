/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan unclosed delimiter: '<'

import std.ast.*

main(): Int64 {
    var input: Tokens = quote(
        a is A<Int64
    )
    let expr = parseExpr(input)
    if (expr is IsExpr) {
        var tp = match (expr as IsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not IsExpr")
        }
        if (!(tp is RefType)) {
            return 2
        }

        var aValue = match (tp as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (aValue != "A<Int64") {
            return 3
        }
        return 0
    }
    return 1
}
