// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = "if (true) { foo() } else { goo() }"
    let ifExprTokens = cangjieLex(code)
    let ifExpr = (parseExpr(ifExprTokens) as IfExpr).getOrThrow()
    let condition = ifExpr.condition
    let conditionToken = (condition as LitConstExpr).getOrThrow().literal
    if (conditionToken.value != "true") {
        return 1
    }
    let ifBody = ifExpr.ifBlock.nodes
    if (ifBody.size != 1) {
        return 2
    }
    let fooCallExpr = (ifBody[0] as CallExpr).getOrThrow()
    let fooRefExpr = (fooCallExpr.callFunc as RefExpr).getOrThrow()
    let fooToken = fooRefExpr.identifier
    if (fooToken.value != "foo") {
        return 2
    }
    let elseBranch = (ifExpr.elseExpr as Block).getOrThrow()
    if (elseBranch.nodes.size != 1) {
        return 3
    }
    let gooCallExpr = (elseBranch.nodes[0] as CallExpr).getOrThrow()
    let gooRefExpr = (gooCallExpr.callFunc as RefExpr).getOrThrow()
    let gooToken = gooRefExpr.identifier
    if (gooToken.value != "goo") {
        return -4
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
