// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package component

internal import std.ast.*

public macro Component(attr: Tokens, input: Tokens): Tokens {
    let funcdecl: FuncDecl = (parseDecl(input) as FuncDecl).getOrThrow()
    let funcname: Token = funcdecl.identifier
    return quote(
    $(funcdecl.keyword) $(funcname)(composer: Composer) {
        composer.start(123)
        $(funcdecl.block.nodes)
        composer.end()
    })
}
