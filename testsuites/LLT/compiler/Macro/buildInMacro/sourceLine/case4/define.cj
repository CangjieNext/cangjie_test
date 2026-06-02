macro package define

internal import std.ast.*

public macro M(input: Tokens) {
    var ret = Tokens()
    var fd = (parseDecl(input) as FuncDecl).getOrThrow()
    ret = ret + fd.keyword + fd.identifier + Token(TokenKind.LPAREN) + fd.funcParams.toTokens() + Token(
        TokenKind.RPAREN) + Token(TokenKind.LCURL)
    var body = fd.block.nodes
    for (i in 0..body.size) {
        if (i == 0) {
            ret += quote(var b = 1)
            ret += Token(TokenKind.NL)
        }
        ret += body[i].toTokens()
        ret += Token(TokenKind.NL)
    }
    ret = ret + Token(TokenKind.RCURL)
    return ret
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

