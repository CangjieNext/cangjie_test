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
    let expr = BinaryExpr(quote((c-- + a)*b))
    var allExpr = match (expr.leftExpr as ParenExpr) {
        case Some(v) => v.parenthesizedExpr
        case None => throw Exception("Not ParenExpr")
    }
    var bExpr = match (allExpr as BinaryExpr) {
        case Some(v) => v.leftExpr
        case None => throw Exception("Not BinaryExpr")
    }

    match (bExpr as IncOrDecExpr) {
        case Some(v) => v.expr = CallExpr(quote(foo([d,e])))
        case None => throw Exception("Not IncOrDecExpr")
    }
    let res = expr.toTokens().toString()
    if (res.contains("(foo([d, e]) -- + a) * b")) {
        return 0
    }

    return 1
}
