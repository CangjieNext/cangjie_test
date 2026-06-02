// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

main() {
    // Test ConcatTokens Append API
    let concatTks = quote(foo + bar + 42) + quote(+ 1)
    var tk1: Token = Token(TokenKind.ADD)
    // ConcatTokens + Token
    var concatTks1 = concatTks + tk1
    concatTks.append(tk1)
    if (concatTks.toString() != "foo + bar + 42 + 1 +") {
        return 1
    }
    if (!compareTokens(concatTks, concatTks1)) {
        return 2
    }

    // ConcatTokens + Tokens
    var concatTks2 = concatTks + quote(2 + 3)
    concatTks.append(quote(2 + 3))
    if (concatTks.toString() != "foo + bar + 42 + 1 + 2 + 3") {
        return 3
    }
    if (!compareTokens(concatTks2, concatTks)) {
        return 4
    }

    // ConcatTokens + Token + Token
    var concatTks3 = concatTks + Token(TokenKind.ADD) + Token(TokenKind.ADD)
    concatTks.append(Token(TokenKind.ADD)).append(Token(TokenKind.ADD))
    if (!compareTokens(concatTks3, concatTks)) {
        return 5
    }

    // ConcatTokens + Tokens + Tokens
    var concatTks4 = concatTks + quote(1 + 2) + quote(3 + 4)
    concatTks.append(quote(1 + 2)).append(quote(3 + 4))
    if (!compareTokens(concatTks4, concatTks)) {
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
