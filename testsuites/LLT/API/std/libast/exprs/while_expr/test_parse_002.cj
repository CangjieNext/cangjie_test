// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let whileExprTokens = quote(
           while (i < 10) {
                a += 1
           }
        )
    let whileExpr = (parseExpr(whileExprTokens) as WhileExpr).getOrThrow()
    let condExpr = whileExpr.condition
    let body = whileExpr.block.nodes
    if (!(condExpr is BinaryExpr)) {
        return 1
    }
    if (body.size != 1) {
        return 2
    }
    if (!(body[0] is AssignExpr)) {
        return 3
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
