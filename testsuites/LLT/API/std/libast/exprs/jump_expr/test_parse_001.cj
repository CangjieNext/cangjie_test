// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

main(): Int64 {
    let jumpExprToken1 = quote(
    	break
    )
    let isJumpExpr = parseExpr(jumpExprToken1) is JumpExpr
    if (!isJumpExpr) {
        return 1
    }
    let jpExpr = (parseExpr(jumpExprToken1) as JumpExpr).getOrThrow()
    if (jpExpr.keyword.kind != TokenKind.BREAK) {
        return 2
    }

    let jpExprToken2 = quote(
        	continue
        )
    let jpExprContinue = (parseExpr(jpExprToken2) as JumpExpr).getOrThrow()
    if (jpExprContinue.keyword.kind == TokenKind.BREAK) {
        return 3
    }
    if (jpExprContinue.keyword.kind != TokenKind.CONTINUE) {
        return 4
    }

    let commomToken = quote(
        1
    )
    let isJumpExpr1 = parseExpr(commomToken) is JumpExpr
    if (isJumpExpr1) {
        return 5
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
