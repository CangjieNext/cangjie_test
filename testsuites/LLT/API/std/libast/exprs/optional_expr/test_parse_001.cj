// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = "a?.b"
    let optionalExprTokens = cangjieLex(code)
    let memberAccess = (parseExpr(optionalExprTokens) as MemberAccess).getOrThrow()
    let optionalExpr = (memberAccess.baseExpr as OptionalExpr).getOrThrow()
    let base = (optionalExpr.baseExpr as RefExpr).getOrThrow()
    let identifier = base.identifier
    if (identifier.value != "a") {
        return 1
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
