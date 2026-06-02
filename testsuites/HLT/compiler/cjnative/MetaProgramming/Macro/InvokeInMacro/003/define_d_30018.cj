/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package D

import std.ast.*
import C.*

public macro d1(x: Tokens, y: Tokens) {
    var res = @c1[0](1)
    quote($res)
}

public macro d2(x: Tokens, y: Tokens) {
    var res = @c2[0](1)
    quote($res)
}
