macro package def

import std.ast.*

public macro Function(name: Tokens, val: Tokens) {
    var tks = quote(func $name() {return $val})
    tks
}

public macro AnotherMacro(name: Tokens, val: Tokens) {
    println("AnotherMacro")
    var tks = quote(@Function[$name]($val))
    tks.dump()
    tks
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
