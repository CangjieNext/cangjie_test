/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_define_20003.cj main_20003.cj
// EXEC: %compiler %cmp_macro macro_define_20003.cj
// EXEC: %compiler %f %cmp_macro
// EXEC: %compiler %cmp_opt  main_20003.cj -o %output


// RUN-EXEC: %run %run_opt %output %run_args

macro package test

public import define_20003.X as x
public import std.ast.*

public macro x(attr: Tokens, input: Tokens) {
    input
}
