// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//ERRCHECK: %run_macro %compiler %cmp_macro  %f
// ASSERT: scan mismatched types
macro package define

internal import std.ast.*

class Tokens {
    public init() {}
}

public macro M(input: Tokens) {
    return input
}
