/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define3

import define1.*
import define2.*
import std.ast.*

public macro M(input: Tokens) {
    return quote(@N @G var a = 1)
}
