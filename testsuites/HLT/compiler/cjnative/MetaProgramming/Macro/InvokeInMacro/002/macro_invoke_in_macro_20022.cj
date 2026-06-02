/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_20022.cj main_20022.cj
// EXEC: %compiler %cmp_macro define_20022.cj
// ERRCHECK: %compiler %f %cmp_opt %macro_opt

macro package use

import std.ast.*
import define_20022.*

interface op{
    operator func [](b:This,c:This):Unit
}

extend Tokens <: op{
    operator func [](b:Tokens,c:Tokens){}
}

public macro Y(attr:Tokens, input:Tokens):Tokens{
    @X[123](123)[@X[123](123)] = @X[123](123)
    return @X[123](123)
}
// ASSERT: scan parse_this_type_not_allow
// ASSERT: scan parse_invalid_left_hand_expr
