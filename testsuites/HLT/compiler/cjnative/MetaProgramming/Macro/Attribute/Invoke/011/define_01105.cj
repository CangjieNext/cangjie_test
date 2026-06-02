/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define_01105

import std.ast.*

public macro X(input: Tokens) {
    X = Y
    return input
}

public macro Y(attr: Tokens, input: Tokens) {
    Y = X
    return attr + input
}
