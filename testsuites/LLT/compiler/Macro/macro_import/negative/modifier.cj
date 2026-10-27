// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expected a macro name after keyword 'macro'

// Modifiers are not allowed on 'macro import' (no re-export form).

macro package m

import std.ast.*

public macro import pc

public macro Dummy(input: Tokens): Tokens {
    input
}
