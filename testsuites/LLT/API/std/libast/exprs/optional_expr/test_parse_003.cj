// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = "a?.b.d?.e"
    let optionalExprTokens = cangjieLex(code)
    let opt = parseExpr(optionalExprTokens)
    let memberAccess1 = (opt as MemberAccess).getOrThrow()
    let f1 = memberAccess1.field
    if (f1.value != "e") {
        return 1
    }
    let optionalExpr = (memberAccess1.baseExpr as OptionalExpr).getOrThrow()
    let memberAccess2 = (optionalExpr.baseExpr as MemberAccess).getOrThrow()
    let f2 = memberAccess2.field
    if (f2.value != "d") {
        return 2
    }
    let memberAccess3 = (memberAccess2.baseExpr as MemberAccess).getOrThrow()

    let f3 = memberAccess3.field
    if (f3.value != "b") {
        return 3
    }
    let optionalExpr1 = (memberAccess3.baseExpr as OptionalExpr).getOrThrow()
    let base = (optionalExpr1.baseExpr as RefExpr).getOrThrow()
    let identifier = base.identifier
    print(identifier.value)
    if (identifier.value != "a") {
        return 4
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
