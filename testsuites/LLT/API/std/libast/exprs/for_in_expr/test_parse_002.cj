// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = quote(
       for(i in 0..10 where i>1) {
        a+=i
       }
    )

    let forinExpr = (parseExpr(code) as ForInExpr).getOrThrow()
    let inexpr = forinExpr.expr
    let patternguard = forinExpr.patternGuard
    let body = forinExpr.block.nodes

    if (!(inexpr is RangeExpr)) {
        return 1
    }
    if (!(patternguard is BinaryExpr)) {
        return 2
    }
    if (body.size != 1) {
        return 3
    }
    if (!(body[0] is AssignExpr)) {
        return 4
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
