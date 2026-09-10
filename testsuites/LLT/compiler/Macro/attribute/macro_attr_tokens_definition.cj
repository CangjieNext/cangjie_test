// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

internal import std.ast.*

public macro AttrKind(inputTokens: Tokens): Tokens {
    let decl = parseDecl(inputTokens)
    let attrs = decl.getAttrs()
    for (attr in attrs) {
        println("value = ${attr.value}, kind = ${attr.kind}")
        println("hasAttr = ${decl.hasAttr(attr.value)}")
    }
    return inputTokens
}
