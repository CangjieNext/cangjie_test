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
    let IsExpr = IsExpr(quote( (a||b) is c ))
    IsExpr.expr = BinaryExpr(quote(e>f))
    let res = IsExpr.toTokens().toString()
    if (res.contains("(e > f) is c")) {
        return 0
    }

    return 1
}
