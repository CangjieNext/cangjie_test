// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package macro_def_pkg

internal import std.ast.*

public macro main_macro_define(a: Tokens): Tokens {
    var temp = macro_expand_test()
    println("this is M")
    print(temp)
    if (temp == 1) {
        return quote(flag = true)
    } else {
        return quote(flag = false)
    }
}
