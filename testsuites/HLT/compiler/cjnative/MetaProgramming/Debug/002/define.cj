/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define

import std.ast.*

public macro SAME(a: Tokens) {
    return a
}

public macro INT(a: Tokens) {
    return quote(0)
}

public macro BOOL(a: Tokens) {
    return quote(true)
}

public macro LIST(a: Tokens) {
    return quote([1])
}

public macro ERROR(a: Tokens) {
    return quote(func a():Int64{true})
}
