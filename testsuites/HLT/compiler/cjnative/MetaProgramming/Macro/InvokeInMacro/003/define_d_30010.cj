/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package D

import std.ast.*
import B.*
import C.*

public macro d(x: Tokens, y: Tokens) {
    var res1 = @b1[1](1)
    var res2 = @b2[1](1)
    var res3 = @c1[1](1)
    var res4 = @c2[1](1)
    quote($(res1+res2+res3+res4))
}
