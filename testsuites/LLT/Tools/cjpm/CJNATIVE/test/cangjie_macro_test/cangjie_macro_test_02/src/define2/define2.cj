// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package b.define2

internal import std.ast.*
internal import b.test20002.*

public macro N(attr: Tokens, input: Tokens): Tokens {
    b1()
    return quote(0)
}
