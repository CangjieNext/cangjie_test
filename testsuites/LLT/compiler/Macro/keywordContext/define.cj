// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package open

internal import std.ast.*

public macro public(private: Tokens, protected: Tokens) {
    return private + quote(+) + quote(3)
}

public macro override(input: Tokens): Tokens {
    return input
}

public macro MultiParam(attr: Tokens, input: Tokens): Tokens {
    var ret1 = quote(var private: Int8 = 2)
    var ret2 = quote(var protected: Int8 = 3)
    return ret1 + ret2
}

public macro UnitLitSame(private: Tokens) {
    return quote($(parseExpr(private)))
}
