/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define

import std.ast.*

public macro VAR_A(input: Tokens) {
    return quote(var a : Int64 = 1)
}

public macro VAR_B(input: Tokens) {
    return quote(var b : Int64 = 1)
}

public macro VAR_C(attr: Tokens, input: Tokens) {
    return quote(var c : Int64 = 1)
}

public macro VAR_D(attr: Tokens, input: Tokens) {
    return quote(var d : Int64 = 1)
}
