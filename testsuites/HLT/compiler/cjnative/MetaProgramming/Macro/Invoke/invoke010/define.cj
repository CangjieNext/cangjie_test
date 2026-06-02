/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define

import std.ast.*

public macro A(input: Tokens) {
    quote(1)
}

public macro B(input: Tokens) {
    quote(2)
}

public macro X(attr: Tokens, input: Tokens) {
    quote(3)
}

public macro D(attr: Tokens, input: Tokens) {
    quote(4)
}
