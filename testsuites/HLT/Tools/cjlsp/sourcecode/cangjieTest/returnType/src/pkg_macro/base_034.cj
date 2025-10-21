/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package returnType.pkg_macro

import std.ast.*

public macro base34(input: Tokens) {
    let inputStr = input.toString()
    let result = quote(
        print($(inputStr) + " = ")
        println($(input)))
    return result
}
