/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    let uExpr = BinaryExpr(quote(-(a+b)*c))
    var expr1 = match (uExpr.leftExpr as UnaryExpr) {
        case Some(v) => v.expr
        case None => throw Exception("Not UnaryExpr")
    }
    match (expr1 as ParenExpr) {
        case Some(v) => v.parenthesizedExpr = CallExpr(quote(foo()))
        case None => throw Exception("Not ParenExpr")
    }
    let res = uExpr.toTokens().toString()
    if (res.contains("-(foo()) * c")) {
        return 0
    }
    return 1
}
