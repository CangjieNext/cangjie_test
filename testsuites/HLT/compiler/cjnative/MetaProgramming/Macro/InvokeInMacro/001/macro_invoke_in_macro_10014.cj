/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_10014.cj main_10014.cj
// EXEC: %compiler %cmp_macro define_10014.cj
// ERRCHECK: %compiler %f  %cmp_opt %macro_opt


macro package use

import std.ast.*
import define_10014.*

public macro Y(attr:Tokens, input:Tokens):Tokens{
    @X[input]
    class A{} 
}
// ASSERT: scan parse_unexpected_declaration_in_scope
