/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main(): Int64 {
    let expr = QuoteExpr()
    expr.dump()

    if (expr.keyword.value != "quote") {
        return 1
    } else if (expr.exprs.size != 0) {
        return 2
    } else if (expr.lParen.value != "(") {
        return 3
    } else if (expr.rParen.value != ")") {
        return 4
    }
    0
}
