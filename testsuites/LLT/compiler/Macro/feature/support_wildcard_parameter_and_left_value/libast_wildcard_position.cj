// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let assignExprToken = quote(_ = 1)
    let assignExpr = parseExpr(assignExprToken)
    let we = ((assignExpr as AssignExpr).getOrThrow().leftExpr as WildcardExpr).getOrThrow()
    var weToken = we.toTokens()[0]
    if (weToken == Token(TokenKind.WILDCARD).addPosition(1, 7, 33)) {
        return 0
    }
    return 1
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

