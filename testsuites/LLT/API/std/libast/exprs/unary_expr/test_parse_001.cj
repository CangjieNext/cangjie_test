// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let unary = "!1"
    let unaryExprTokens = cangjieLex(unary)
    let isUnary = parseExpr(unaryExprTokens) is UnaryExpr
    if (!isUnary) {
        return 1
    }
    let ue = (parseExpr(unaryExprTokens) as UnaryExpr).getOrThrow()
    let expr = ue.expr
    if (!(expr is LitConstExpr)) {
        return 2
    }
    let opKind = ue.op
    if (opKind.value != '!') {
        return 3
    }

    let unaryFail = "a++"
    let uExprTokens = cangjieLex(unaryFail)
    let isUnaryFail = parseExpr(uExprTokens) is UnaryExpr
    if (isUnaryFail) {
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
