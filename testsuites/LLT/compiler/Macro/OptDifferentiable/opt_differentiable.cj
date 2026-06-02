// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package macros

internal import std.ast.*

class MyLayer {
    public var a = 1
    public init() {
        a = 2
    }
}
/**
 * Attribute macro definition
 */
public macro OptDifferentiable(attr: Tokens, input: Tokens): Tokens {
    let a = Array<MyLayer>(1000000, {i => MyLayer()})
    let b = Array<MyLayer>(1000000, {i => MyLayer()})
    let c = Array<MyLayer>(1000000, {i => MyLayer()})
    let structDecl: StructDecl = (parseDecl(input) as StructDecl).getOrThrow()
    return quote($(structDecl))
}
