/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define_01108

import std.ast.*

public macro Y(attr: Tokens, input: Tokens) {
    return attr + input
}

public macro M(attr: Tokens, input: Tokens) {
    var a = Y
    return attr + input
}
