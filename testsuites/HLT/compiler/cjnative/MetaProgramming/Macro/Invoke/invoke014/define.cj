/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define

import std.ast.*

var x = 1
var y = 1

public macro A(input: Tokens) {
    if (x < 2) {
        x = x + 1
        return quote(0)
    }
    return quote(1)
}

public macro B(input: Tokens) {
    if (x < 2) {
        x = x + 1
        return quote(\@A(1))
    }
    return quote(0)
}

public macro X(attr: Tokens, input: Tokens) {
    if (y < 2) {
        y = y + 1
        return quote(0)
    }
    return quote(1)
}

public macro D(attr: Tokens, input: Tokens) {
    if (y < 2) {
        y = y + 1
        return quote(\@X[0](1))
    }
    return quote(1)
}
