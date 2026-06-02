/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package B

import A.*
import std.ast.*

public macro b1(x: Tokens, y: Tokens) {
    @a1[0](1)
    @a2[0](1)
    @a3[0](1)
    @a4[0](1)
    @a5[0](1)
    quote(0)
}
