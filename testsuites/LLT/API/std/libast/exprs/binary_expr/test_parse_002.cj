// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = "3.14 - 2.718"
    let binaryExprTokens = cangjieLex(code)
    let binaryExpr = (parseExpr(binaryExprTokens) as BinaryExpr).getOrThrow()
    let leftExpr = binaryExpr.leftExpr
    let leftLitConstExpr = (leftExpr as LitConstExpr).getOrThrow()
    let leftLiteralToken = leftLitConstExpr.literal
    if (leftLiteralToken != Token(TokenKind.FLOAT_LITERAL, "3.14").addPosition(0, 1, 1)) {
        return 1
    }
    let opKind = binaryExpr.op
    if (opKind.kind != TokenKind.SUB) {
        return 2
    }
    let rightExpr = binaryExpr.rightExpr
    let rightLitConstExpr = (rightExpr as LitConstExpr).getOrThrow()
    let rightLiteralToken = rightLitConstExpr.literal
    if (rightLiteralToken != Token(TokenKind.FLOAT_LITERAL, "2.718").addPosition(0, 1, 8)) {
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
