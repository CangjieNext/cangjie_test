// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package b.macro_definition2

internal import std.ast.*

public macro ModifyFunc(input: Tokens): Tokens {
    println("I'm in macro body")
    return quote(
        func MyFunc(composer: Composer) {
            composer.start(123)
            counter++
            composer.end()
    })
}
