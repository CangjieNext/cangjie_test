// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = "A.bar().foo()" // quite complex to decompose.
    let callExprTokens = cangjieLex(code)
    let callExpr = (parseExpr(callExprTokens) as CallExpr).getOrThrow()
    let baseFunc = callExpr.callFunc
    let memberAccess = (baseFunc as MemberAccess).getOrThrow() // A.bar().foo

    let base1 = memberAccess.baseExpr // A.bar() which is a callExpr
    let callExpr2 = (base1 as CallExpr).getOrThrow()
    let baseFunc2 = callExpr2.callFunc // A.bar which is a memberAccess
    let memberAccess2 = (baseFunc2 as MemberAccess).getOrThrow()
    let ref1 = (memberAccess2.baseExpr as RefExpr).getOrThrow()
    let identifier = ref1.identifier
    if (identifier != Token(TokenKind.IDENTIFIER, "A").addPosition(0, 1, 1)) {
        return 1
    }
    let field = memberAccess.field
    if (field.value != "foo") {
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
