// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test_macro_define.cj
// EXEC: %compiler %cmp_macro test_macro_define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output
// ASSERT: scan cannot use 'public' on interface declarations in a macro package


macro package use

import std.ast.*
import define.*

public interface op<T>{
    operator func !():T
}

extend Tokens <: op<Tokens>{
    operator func !(){this}
}

public macro Y(attr:Tokens, input:Tokens):Tokens{
    !@X[123](123)
}
