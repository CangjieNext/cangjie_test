macro package A

import std.ast.*

public macro M(attrs:Tokens, input:Tokens):Tokens{
    return attrs + input
}

// ASSERT: scan added M 1A1MM6Tokens6Tokens at 5,14
// ASSERT: scan deleted 1A1MM6Tokens
// ASSERT: scan incremental compilation triggered


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
