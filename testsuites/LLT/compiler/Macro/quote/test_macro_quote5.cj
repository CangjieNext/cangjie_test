// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_macro %noColor %f

macro package view

internal import std.ast.*

public macro test(input: Tokens): Tokens {
    let a: Tokens = quote("/**/")

    let b: Tokens = quote("\n")

    let c: Tokens = quote("//")

    input
}
