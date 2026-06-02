// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f %cmp_macro
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

macro package pkg1

internal import std.ast.*

public macro Foo(attrTokens: Tokens, inputTokens: Tokens): Tokens {
    return attrTokens + inputTokens
}

public macro Foo(inputTokens: Tokens): Tokens {
    return inputTokens
}

public macro Bar(inputTokens: Tokens): Tokens {
    return inputTokens
}

public macro Bar(attrTokens: Tokens, inputTokens: Tokens): Tokens {
    return attrTokens + inputTokens
}
