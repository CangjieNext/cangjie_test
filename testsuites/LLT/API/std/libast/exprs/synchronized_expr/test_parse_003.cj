// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        synchronized(mtx) {
            count = count + 1
        }
    )
    let realExpr = parseExpr(input) is SynchronizedExpr
    let syncExpr = (parseExpr(input) as SynchronizedExpr).getOrThrow()
    if (!realExpr) {
        return 1
    }

    let inputOther = quote(
        a++
    )
    let failExpr = parseExpr(inputOther) is SynchronizedExpr
    if (failExpr) {
        return 2
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
