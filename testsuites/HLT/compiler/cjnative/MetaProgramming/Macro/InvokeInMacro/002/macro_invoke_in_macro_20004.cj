/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_20004.cj main_20004.cj

// EXEC: %compiler %cmp_macro define_20004.cj
// ERRCHECK: %compiler %f %cmp_opt %macro_opt
 
macro package use

import std.ast.*
import define_20004.*

public interface op<T>{
    operator func !():T
}

extend Tokens <: op<Tokens>{
    operator func !(){this}
}


public macro Y(attr:Tokens, input:Tokens):Tokens{
    !@X[123](123)
}
// ASSERT: scan parse_expected_macro_decl_in_macro_package
