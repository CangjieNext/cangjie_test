// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

main() {
    // Test Tokens Append API
    let tks: Tokens = quote(foo + bar + 42)
    var tk1: Token = Token(TokenKind.ADD)
    // Tokens + Token
    var tks2 = tks + tk1
    tks.append(tk1)
    if (!compareTokens(tks, tks2)) {
        return 1
    }
    // Tokens + Tokens
    var tks3 = tks + quote(1 + 2)
    tks.append(quote(1 + 2))
    if (!compareTokens(tks, tks3)) {
        return 2
    }

    // Tokens + Tokens + Tokens
    var tks5 = tks + quote(3 + 4) + quote(5 + 6)
    if (tks5.toString() != "foo + bar + 42 + 1 + 2 3 + 4 5 + 6") {
        return 3
    }
    tks.append(quote(3 + 4)).append(quote(5 + 6))
    if (tks.toString() != "foo + bar + 42 + 1 + 2 3 + 4 5 + 6") {
        return 4
    }
    if (!compareTokens(tks, tks5)) {
        return 5
    }

    // Tokens + Token + Token
    var tks6 = tks + Token(TokenKind.ADD) + Token(TokenKind.ADD)
    tks.append(Token(TokenKind.ADD)).append(Token(TokenKind.ADD))
    if (!compareTokens(tks6, tks)) {
        return 6
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
