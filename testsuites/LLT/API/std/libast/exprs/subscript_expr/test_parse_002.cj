// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        arr[0][1]
    )
    let realExpr = parseExpr(input) is SubscriptExpr
    if (!realExpr) {
        return 1
    }

    let inputOther = quote(
        a++
    )
    let failExpr = parseExpr(inputOther) is SubscriptExpr
    if (failExpr) {
        return 2
    }
    let subsexpr = (parseExpr(input) as SubscriptExpr).getOrThrow()
    if (!(subsexpr.baseExpr is SubscriptExpr)) {
        return 3
    }

    if (subsexpr.indexList.size != 1) {
        return 4
    }
    if (!(subsexpr.indexList[0] is LitConstExpr)) {
        return 5
    }
    let init2 = (subsexpr.indexList[0] as LitConstExpr).getOrThrow()
    if (init2.literal.value != "1") {
        return 6
    }

    let subsubsexpr = (subsexpr.baseExpr as SubscriptExpr).getOrThrow()
    if (!(subsubsexpr.baseExpr is RefExpr)) {
        return 7
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
