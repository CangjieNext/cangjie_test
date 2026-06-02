// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define2.cj 
// ERRCHECK: %compiler define2.cj %cmp_macro
// ASSERT: regex-auto function 'M1' has overload conflicts 
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// negative case

macro package p1

internal import std.ast.*

// The err msg says function M1 has overload conflicts, which is not correct.
public macro M1(input: Tokens) {
    return input
}

// The error message here is not Okay, too much noise.
func M1(input: Tokens): Tokens {
    return input
}
