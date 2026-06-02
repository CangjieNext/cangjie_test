// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler test_macro3.cj %cmp_macro
macro package view

internal import std.ast.*

public macro callView(input: Tokens): Tokens {
    let token = cangjieLex("var c:Int64 = 3")
    token.dump()
    return input
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
