/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: test20001.cj main.cj
// EXEC: %compiler test20001.cj %compile_lib_opt
// EXEC: %compiler %f %cmp_macro libtest20001.a
// EXEC: %run_macro %compiler %cmp_opt  main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args

macro package define

import std.ast.*
import test20001.*

public macro M(attr: Tokens, input: Tokens): Tokens {
    a()
    return quote(0)
}
