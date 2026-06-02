/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package C

import std.ast.*
import A.*

public macro c0(x: Tokens, y: Tokens) {
    var res = @a2[1](1)
    quote($res)
}
