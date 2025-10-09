// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package pro1.define2

internal import std.ast.*
internal import pro1.test20002.*

public macro N(attr: Tokens, input: Tokens): Tokens {
    b()
    return quote(0)
}
