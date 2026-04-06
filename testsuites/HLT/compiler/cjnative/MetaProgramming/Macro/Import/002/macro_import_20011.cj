/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_define_20011.cj main_20011.cj
// EXEC: %compiler %cmp_opt %macro_opt -o libdefine.%test_suffix macro_define_20011.cj
// EXEC: %compiler %f %macro_opt -o %n.%test_suffix
// EXEC: %compiler %cmp_opt  -L. -ldefine main_20011.cj -o %output


macro package test

import std.ast.*

public macro x(input: Tokens) {
    input
}
