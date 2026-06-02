/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_macro %f
// ERRCHECK: %run_macro %compiler %cmp_opt define.o main.cj -o %output
// ASSERT:scan invalid binary file 'define.o'

macro package define

import std.ast.*

public macro M0(a: Tokens) {
    return quote(0)
}

public macro M1(a: Tokens, b: Tokens) {
    return quote(1)
}

// ASSERT: regex-not no position error occurred
