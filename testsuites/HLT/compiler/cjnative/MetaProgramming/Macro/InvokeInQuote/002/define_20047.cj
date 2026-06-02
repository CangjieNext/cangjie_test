/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define_20047

import std.ast.*

var count = 1

public macro X(attr: Tokens, input: Tokens) {
    print("count is ${count}!\n")
    count = count + 1
    return quote(1-1)
}

public macro Y(input: Tokens) {
    print("count is ${count}!\n")
    count = count + 1
    return quote(1-1)
}
