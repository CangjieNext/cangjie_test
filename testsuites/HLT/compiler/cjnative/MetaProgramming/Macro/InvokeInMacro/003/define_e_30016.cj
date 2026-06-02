/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package E

import std.ast.*
import C.*
import D.*

public macro e1(x: Tokens, y: Tokens) {
    var res1 = @c1[0](1)
    var res2 = @d1[0](1)
    quote($(res1+res2))
}

public macro e2(x: Tokens, y: Tokens) {
    var res1 = @c2[0](1)
    var res2 = @d2[0](1)
    quote($(res1+res2))
}
