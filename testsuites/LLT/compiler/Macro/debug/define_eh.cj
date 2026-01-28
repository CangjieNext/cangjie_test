// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package pkg_eh

internal import std.ast.*

public macro Foo(_: Tokens): Tokens {
    quote(try {} handle (_: Command<Unit>) {})
}
