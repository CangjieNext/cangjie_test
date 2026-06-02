// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        0..10:3
    )
    let realExpr = parseExpr(input) is RangeExpr
    if (!realExpr) {
        return 1
    }

    let inputOther = quote(
        a++
    )
    let failExpr = parseExpr(inputOther) is RangeExpr
    if (failExpr) {
        return 2
    }
    let rangeExpr = (parseExpr(input) as RangeExpr).getOrThrow()
    let step = rangeExpr.step
    if (!(step is LitConstExpr)) {
        return 3
    }
    let stepVal = (step as LitConstExpr).getOrThrow().literal
    if (stepVal.value != "3") {
        return 4
    }

    let end = rangeExpr.end
    if (!(end is LitConstExpr)) {
        return 5
    }
    let endVal = (end as LitConstExpr).getOrThrow().literal
    if (endVal.value != "10") {
        return 6
    }

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
