// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package b.D

internal import std.ast.*
import b.A.*
import b.B.*
import b.C.*

public macro d1(x: Tokens, y: Tokens) {
    var res1 = @a1[0](1)
    var res2 = @b1[0](1)
    var res3 = @c1[0](1)
    quote($(res1+res2+res3))
}

public macro d2(x: Tokens, y: Tokens) {
    var res1 = @a2[0](1)
    var res2 = @b2[0](1)
    var res3 = @c2[0](1)
    quote($(res1+res2+res3))
}
