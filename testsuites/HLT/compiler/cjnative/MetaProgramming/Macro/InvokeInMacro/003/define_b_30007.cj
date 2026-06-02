/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package B

import std.ast.*
import A.*

public macro b1(x: Tokens, y: Tokens) {
    var res = @a[1](1)
    quote($res)
}

public macro b2(x: Tokens, y: Tokens) {
    var res = @a[1](1)
    quote($res)
}
