// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

main(): Int64 {
    let input = quote(
        Int64.foo
    )
    let memberAccess = (parseExpr(input) as MemberAccess).getOrThrow()
    let primitiveTypeExpr = (memberAccess.baseExpr as PrimitiveTypeExpr).getOrThrow()
    let output = quote($primitiveTypeExpr)
    if (input.size != 5) {
        return 1
    }
    let flag = compareTokens(input[1] + Tokens(), output)
    if (!flag) {
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
