// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f %cmp_macro 

macro package view

internal import std.ast.*

public macro test(input: Tokens): Tokens {
    var a = quote($('\u{0}'))
    input
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
