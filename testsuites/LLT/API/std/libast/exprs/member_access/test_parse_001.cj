// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = "a.b"
    let memberAccessTokens = cangjieLex(code)
    let memberAccess = (parseExpr(memberAccessTokens) as MemberAccess).getOrThrow()
    let base = (memberAccess.baseExpr as RefExpr).getOrThrow()
    let identifier = base.identifier
    identifier.dump()
    Token(TokenKind.IDENTIFIER, "a").addPosition(0, 1, 1).dump()
    if (identifier != Token(TokenKind.IDENTIFIER, "a").addPosition(0, 1, 1)) {
        return 1
    }
    let field = memberAccess.field
    if (field.value != "b") {
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
