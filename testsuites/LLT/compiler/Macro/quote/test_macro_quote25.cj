// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_macro %noColor %f 2>&1 | compare %f
// ASSERT: scan expected '}'

macro package view
internal import std.ast.*

public macro test(input: Tokens): Tokens{
    var x = quote($( while (true) {quote(0)))
    return x
}
