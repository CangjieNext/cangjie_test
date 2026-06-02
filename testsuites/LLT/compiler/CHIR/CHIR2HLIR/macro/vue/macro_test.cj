// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package test

internal import std.ast.*
internal import std.runtime.*

public macro callTest(attr: Tokens, input: Tokens): Tokens {
    GC()
    return attr + input
}
