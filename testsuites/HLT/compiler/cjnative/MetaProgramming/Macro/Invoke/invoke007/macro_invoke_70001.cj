/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test_70001.cj
// EXEC: %compiler %cmp_macro %f
// EXEC-PIPE: %run_macro %compiler %cmp_opt  test_70001.cj -o %output | compare %f
// ASSERT: scan hello macro
// RUN-EXEC: %run %run_opt %output  %run_macro_opt %run_args

macro package define

import std.ast.*

public macro M(input: Tokens) {
    print("hello macro")
    input + quote(+) + input
}
// ASSERT: regex-not no position error occurred
