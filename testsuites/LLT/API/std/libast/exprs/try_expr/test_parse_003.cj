// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        try {
            return x + x
        } catch (e: RuntimeException) {
            print("RuntimeException\n")
        }
    )
    let realExpr = parseExpr(input) is TryExpr
    if (!realExpr) {
        return 1
    }

    let inputOther = quote(
        a++
    )
    let failExpr = parseExpr(inputOther) is TryExpr
    if (failExpr) {
        return 2
    }

    let input1 = quote(
        throw Exception()
    )
    let rExpr = parseExpr(input1) is ThrowExpr
    if (!rExpr) {
        return 3
    }

    let fExpr = parseExpr(inputOther) is ThrowExpr
    if (fExpr) {
        return 4
    }
    let tryexpr = (parseExpr(input) as TryExpr).getOrThrow()
    if (!tryexpr.resourceSpec.isEmpty()) {
        return 5
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
