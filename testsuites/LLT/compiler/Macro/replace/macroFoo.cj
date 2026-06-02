// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package pkg1

internal import std.ast.*

// 1.macro definition
public macro Foo(input: Tokens): Tokens {
    return quote(func test(){return 42})
}

public macro Bar1(input: Tokens): Tokens {
    return input
}

public macro Bar2(attr: Tokens, input: Tokens): Tokens {
    return input
}

public macro Baz(input: Tokens): Tokens {
    return input
}
