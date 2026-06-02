// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p1 p2
// EXEC: %compiler %cmp_macro %f
// EXEC: %compiler -p p1 -o %output
// EXEC: %run %run_opt %run_args %output 2>&1 | compare %f
// ASSERT: regex 3

macro package D

import std.ast.*

public macro M(input: Tokens) {
    input
}
