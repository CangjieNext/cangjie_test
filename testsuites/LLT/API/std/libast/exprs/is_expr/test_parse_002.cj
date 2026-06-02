// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        1+2 is Int64
    )
    let isExpr = (parseExpr(input) as IsExpr).getOrThrow()
    let expr = isExpr.expr
    let ty = isExpr.shiftType
    if (!(expr is BinaryExpr)) {
        return 1
    }
    if (!(ty is PrimitiveType)) {
        return 2
    }
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
