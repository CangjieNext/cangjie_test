/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_20046.cj main_20046.cj
// EXEC: %compiler %cmp_macro define_20046.cj
// ERRCHECK: %compiler %f %macro_opt 


macro package use

import std.ast.*
import define_20046.*

interface I{
    let i : Int64 = 1
}

public macro Y(attr:Tokens, input:Tokens):Tokens{
    I.@X[i](123) 
    return quote(1)
}
// ASSERT: regex expected a member name after '.' in qualified name, found '@'
// ASSERT: regex-not no position error occurred
