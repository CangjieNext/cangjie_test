// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Alias form: 'macro import p as q' binds the target package to the local name
// q inside this macro package only. The injected import for consumers MUST be
// stripped of the alias (`import p`): if the alias leaked (`import q`), the
// downstream call hello() would fail since no package q exists — which is the
// observable check in call.cj (UT-D-04).

macro package m

import std.ast.*

macro import p as q

public macro Dummy(input: Tokens): Tokens {
    input
}
