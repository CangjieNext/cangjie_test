/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2 EXCLUDE
// DEPENDENCE: macro_define_50002.cj main_50002.cj
// EXEC: %compiler %cmp_macro macro_define_50002.cj
// EXEC: %run_macro %compiler  %f %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt  main_50002.cj -o %output

// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_macro_opt %run_macro_opt %run_macro_opt %run_args

macro package test

public import define_50002.*

func foo() {
    return 0
}
