/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main(): Int64 {
    let assignExprToken = quote(_ = 1)
    let assignExpr = parseExpr(assignExprToken)
    let wee = match (assignExpr as AssignExpr) {
        case Some(v) => v.leftExpr
        case None => throw Exception("Not AssignExpr")
    }

    var result = 2
    if (wee is WildcardExpr) {
        result -= 1
    }

    var weeExpr = match (wee as WildcardExpr) {
        case Some(v) => v
        case None => throw Exception("Not WildcardExpr")
    }
    if ((weeExpr is WildcardExpr)) {
        result -= 1
    }
    return result
}
