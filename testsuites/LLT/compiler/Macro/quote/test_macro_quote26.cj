// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %f %cmp_macro 
// ASSERT: regex-auto expected identifier after '$'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

macro package view
internal import std.ast.*

public macro test(input: Tokens):Tokens {
    let a = 3
    quote($match (a) {
                case 2 => quote(0)
                case _ => quote(1)
                })

    input
}


