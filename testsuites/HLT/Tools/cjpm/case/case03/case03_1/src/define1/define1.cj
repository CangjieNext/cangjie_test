/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package macro_calling.define1

import std.ast.*
public import macro_calling.pkg1.A

public macro X(inputs: Tokens) {
    var tks = quote(var x = A();)
    tks += inputs
    tks
}
