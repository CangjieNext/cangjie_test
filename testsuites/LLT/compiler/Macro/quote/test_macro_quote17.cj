// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f %cmp_macro

macro package view

internal import std.ast.*

public macro test(input: Tokens): Tokens {
    if (true) {
        return quote(0)
    }
    return quote(1)
}

public macro test2(input: Tokens): Tokens {
    var x = quote($(quote(0)))
    var y = quote($(quote(0)))
    if (x.size != 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
        return quote(2)
    }
    return x
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
