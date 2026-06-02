// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        if (a > 2) {
            let b = a + foo()
            var c = b + 2
            c = c + 200 * 3
            return c
        } else if ( a < -2) {
            let c = 42
            return c
        } else {
            return 42
        }
    )

    let ifExpr = (parseExpr(input) as IfExpr).getOrThrow()
    let condition = ifExpr.condition
    if (!(condition is BinaryExpr)) {
        return 1
    }
    let ifBody = ifExpr.ifBlock.nodes
    if (ifBody.size != 4) {
        return 2
    }
    let elseBranch = ifExpr.elseExpr
    let elseNodes = (elseBranch as IfExpr).getOrThrow().ifBlock.nodes
    if (elseNodes.size != 2) {
        return 3
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
