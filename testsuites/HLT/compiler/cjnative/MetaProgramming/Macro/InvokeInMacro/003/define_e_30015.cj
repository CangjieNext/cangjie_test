/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package E

import std.ast.*
import A.*
import B.*
import C.*
import D.*

public macro e1(x: Tokens, y: Tokens) {
    var res1 = @a[0](1)
    var res2 = @b[0](1)
    var res3 = @c0[0](1)
    var res4 = @d[0](1)
    quote($(res1+res2+res3+res4))
}

public macro e2(x: Tokens, y: Tokens) {
    var res1 = @a[0](1)
    var res2 = @b[0](1)
    var res3 = @c0[0](1)
    var res4 = @d[0](1)
    quote($(res1+res2+res3+res4))
}
