// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package demo.macro_definition

import std.ast.*
import dep.aoo.*

public macro TestDef(input: Tokens): Tokens {
    println("I'm in macro body")
    depAoo()
    return input
}

