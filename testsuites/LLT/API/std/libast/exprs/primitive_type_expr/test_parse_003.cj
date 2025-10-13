// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
       Int64.foo
    )
    let memberAccess = (parseExpr(input) as MemberAccess).getOrThrow()
    let primitiveTypeExpr = (memberAccess.baseExpr as PrimitiveTypeExpr).getOrThrow()
    let realExpr = memberAccess.baseExpr is PrimitiveTypeExpr
    if (!realExpr) {
        return 1
    }
    let tok = primitiveTypeExpr.toTokens()
    let tokEmpty = Token()
    if (tok.size != 1) {
        return 2
    }
    if (tok[0].pos.isEmpty()) {
        return 3
    }
    if (!tokEmpty.pos.isEmpty()) {
        return 4
    }
    if (tok[0].pos != Position(1, 8, 8)) {
        return 5
    }
    let inputOther = quote(
        a++
    )
    let failExpr = parseExpr(inputOther) is PrimitiveTypeExpr
    if (failExpr) {
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
