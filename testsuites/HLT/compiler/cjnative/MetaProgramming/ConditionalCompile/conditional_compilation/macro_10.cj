/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package test

import std.ast.*

@When[!debug]
public macro M(b: Tokens) {
    var res = quote(var a = 1)
    return res
}

@When[debug]
public macro M(b: Tokens) {
    var res = quote(var a = 2)
    return res
}
