/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package D

import std.ast.*
import A.*
import B.*

public macro d1(x: Tokens, y: Tokens) {
    var res1 = @a1[0](1)
    var res2 = @b1[0](1)
    quote($(res1+res2))
}

public macro d2(x: Tokens, y: Tokens) {
    var res1 = @a2[0](1)
    var res2 = @b2[0](1)
    quote($(res1+res2))
}
