// EXEC-PIPE-1: %frontendCompiler %f %cmp_macro 2>&1 | compare %f
// ASSERT: scan expected ')'

macro package view
internal import std.ast.*

public macro test(input: Tokens):Tokens {
    let a: Tokens = quote(//)  // EXPECTED: regex-auto expected '(' or ')' to match in quote

    input
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

