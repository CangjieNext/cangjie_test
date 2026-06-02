/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_define_10021.cj
// (not iOS) EXEC: %compiler %cmp_macro macro_define_10021.cj
// (not iOS) EXEC: %run_macro %compiler %cmp_opt  %f -o %output

macro package test

import define_10021.X as x
import std.ast.*

public macro x(attr: Tokens, input: Tokens) {
    return input
}

main() {
}
