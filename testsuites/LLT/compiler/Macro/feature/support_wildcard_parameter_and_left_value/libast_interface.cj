// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let assignExprToken = quote(_ = 1)
    let assignExpr = parseExpr(assignExprToken)
    let wee = (assignExpr as AssignExpr).getOrThrow().leftExpr

    var result = 1
    if (wee is WildcardExpr) {
        result -= 1
    }
    return result
}
