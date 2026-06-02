// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let doWhileExprTokens = quote(
    	do { foo() } while ( true )
    )
    let doWhileExpr = (parseExpr(doWhileExprTokens) as DoWhileExpr).getOrThrow()
    let condition = doWhileExpr.condition
    let conditionToken = (condition as LitConstExpr).getOrThrow().literal
    if (conditionToken.value != "true") {
        return 1
    }
    let doWhileBody = doWhileExpr.block.nodes
    if (doWhileBody.size != 1) {
        return 2
    }
    let fooCallExpr = (doWhileBody[0] as CallExpr).getOrThrow()
    let fooRefExpr = (fooCallExpr.callFunc as RefExpr).getOrThrow()
    let fooToken = fooRefExpr.identifier
    if (fooToken.value != "foo") {
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
