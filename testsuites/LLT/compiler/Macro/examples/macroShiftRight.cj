// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

internal import std.ast.*

public macro ShiftRight(body: Tokens) {
    var result = Tokens()
    result += body
    result += Token(TokenKind.RSHIFT, ">>")
    result += quote(3)
    return result
}

public macro LeftRight(body: Tokens) {
    var result = Tokens()
    result += body
    result += Token(TokenKind.LSHIFT, "<<")
    result += quote(3)
    return result
}

public macro ShiftRightAssign(body: Tokens) {
    var result = Tokens()
    result += body
    result += Token(TokenKind.RSHIFT_ASSIGN, ">>=")
    result += quote(3)
    return result
}

public macro GE(body: Tokens) {
    var result = Tokens()
    result += body
    result += Token(TokenKind.GE, ">=")
    result += quote(3)
    return result
}

public macro LE(body: Tokens) {
    var result = Tokens()
    result += body
    result += Token(TokenKind.LE, "<=")
    result += quote(3)
    return result
}
