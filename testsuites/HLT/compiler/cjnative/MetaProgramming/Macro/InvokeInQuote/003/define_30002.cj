/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define_30002

import std.ast.*

public macro A(input: Tokens) {
    return quote(1+1)
}

public macro B(attr: Tokens, input: Tokens) {
    return quote(1+1)
}
