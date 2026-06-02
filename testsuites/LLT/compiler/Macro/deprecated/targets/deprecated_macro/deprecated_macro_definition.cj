// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package x

import std.ast.*

@Deprecated["DONTUSE", since: "1990", strict: false]
public macro Macro(input: Tokens): Tokens {
    return input
}
