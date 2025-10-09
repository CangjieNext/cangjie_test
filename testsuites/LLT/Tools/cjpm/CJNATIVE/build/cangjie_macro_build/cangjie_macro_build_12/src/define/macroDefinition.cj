// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package b.define

internal import std.ast.*
internal import b.test20001.*

public macro M(attr: Tokens, input: Tokens): Tokens {
    a()
    return quote(0)
}
