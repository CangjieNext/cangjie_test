// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    var input: Tokens = quote(foo(){=>1})
    let expr = parseExpr(input)
    if (expr is TrailingClosureExpr) {
        var b = (expr as TrailingClosureExpr).getOrThrow()
        if (((b.expr as CallExpr).getOrThrow().callFunc as RefExpr).getOrThrow().identifier.value != "foo") {
            return 1
        }
        return 0
    }
    return 2
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
