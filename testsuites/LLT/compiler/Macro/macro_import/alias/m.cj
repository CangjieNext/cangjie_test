// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Alias form: 'macro import p as q' is a rebinding aligned with ordinary
// imports: the .macrocall injects the full `import p as q`, so downstream
// sees the package under q (and the flat members, same as a bare package
// import). call.cj observes this via hello() resolving at runtime.

macro package m

import std.ast.*

macro import p as q

public macro Dummy(input: Tokens): Tokens {
    input
}
