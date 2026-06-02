// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

internal import std.ast.*

public macro Outer(input: Tokens) {
    return input
}

public macro Inner(input: Tokens) {
    var flag = insideParentContext("Outer")
    if (flag) {
        return Tokens() + Token(TokenKind.INTEGER_LITERAL, "1")
    }
    return Tokens() + Token(TokenKind.INTEGER_LITERAL, "2")
}
