// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package r 

import std.ast.*

public macro foo(a: Tokens)
public macro foo(a: Tokens, b: Tokens)

public macro bar(a: Tokens): Tokens
public macro bar(a: Tokens, b: Tokens): Tokens
