// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

internal import std.ast.*

public macro M1(input: Tokens) {
    input
}

public macro M2(input: Tokens) {
    quote($(parseDecl(input)))
}

public macro M3(input: Tokens) {
    quote(
    $(parseDecl(input))
    class B3 {
        func testB() {
            var b = 1
            return b + 2
        }
    })
}

public macro M4(input: Tokens) {
    quote(
    class B4 {
        func testB() {
            var b = 1
            return b + 2
        }
    }
    $(parseDecl(input))
    )
}

public macro M5(input: Tokens): Tokens {
    let ret = Tokens()

    ret.append(input[0])
    ret.append(input[1])
    ret.append(input[2])
    ret.append(input[3])
    ret.append(input[4])

    ret.append(input[10])
    ret.append(input[11])
    ret.append(input[12])
    ret.append(input[13])
    ret.append(input[14])

    ret.append(input[15])
    ret.append(input[16])
    ret.append(input[17])
    ret.append(input[18])
    ret.append(input[19])
    ret.append(input[20])
    ret.append(input[21])
    return ret
}

public macro M6(input: Tokens): Tokens {
    let ret = Tokens()

    ret.append(input[0])
    ret.append(input[1])
    ret.append(input[2])
    ret.append(quote(3 + 7))
    ret.append(input[4])

    ret.append(input[5])
    ret.append(input[6])
    ret.append(input[7])
    ret.append(input[8])
    ret.append(input[9])

    ret.append(input[10])
    ret.append(input[11])
    ret.append(input[12])
    ret.append(input[13])
    ret.append(input[14])
    ret.append(input[15])
    ret.append(input[16])
    return ret
}

public macro M7(input: Tokens): Tokens {
    let ret = Tokens()

    ret.append(quote(var))
    ret.append(input[1])
    ret.append(quote( = 12))
    ret.append(Token(TokenKind.NL))

    ret.append(quote(let w))
    ret.append(input[2])
    ret.append(quote(1))
    ret.append(Token(TokenKind.NL))

    ret.append(quote(a = ))
    ret.append(input[3])
    ret.append(Token(TokenKind.NL))

    ret.append(quote(a = 7;))

    ret.append(input[5])
    ret.append(input[6])
    ret.append(input[7])
    ret.append(input[8])
    ret.append(input[9])

    ret.append(input[10])
    ret.append(input[11])
    ret.append(input[12])
    ret.append(input[13])
    ret.append(input[14])
    ret.append(input[15])
    ret.append(input[16])

    return ret
}

public macro M8(input: Tokens): Tokens {
    let ret = Tokens()
    ret.append(input[5])
    ret.append(input[6])
    ret.append(input[7])
    ret.append(input[8])
    ret.append(input[9])

    ret.append(input[0])
    ret.append(input[1])
    ret.append(input[2])
    ret.append(input[3])
    ret.append(input[4])

    ret.append(input[10])
    ret.append(input[11])
    ret.append(input[12])
    ret.append(input[13])
    ret.append(input[14])
    ret.append(input[15])
    ret.append(input[16])
    return ret
}
