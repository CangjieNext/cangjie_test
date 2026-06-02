/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test_70002.cj
// EXEC: %compiler %cmp_macro %f
// EXEC-PIPE: %compiler %cmp_opt  test_70002.cj -o %output | compare %f
// ASSERT: scan hello macro
// RUN-EXEC: %run %run_opt %output  %run_args

macro package define

import std.ast.*

public macro M(input: Tokens) {
    print("hello macro")
    return input + quote(+) + Tokens([Token(INTEGER_LITERAL, "1")]) // integer literal is 152

}
// ASSERT: regex-not no position error occurred
