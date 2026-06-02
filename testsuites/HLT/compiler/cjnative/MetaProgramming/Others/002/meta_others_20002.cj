/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test_20002.cj test_20002_2.cj
// EXEC: %compiler %f %cmp_macro
// EXEC: %compiler  test_20002.cj %cmp_macro
// ERRCHECK: %compiler %cmp_opt test_20002_2.cj  -o %output

macro package define

import std.ast.*

public macro M1(input: Tokens) {
    return quote(0)
}
// ASSERT: scan macro_undeclared_identifier
