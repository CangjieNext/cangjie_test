/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_20056.cj define_20056a.cj main_20056.cj
// EXEC: %compiler  define_20056.cj %cmp_macro 
// EXEC: %compiler  define_20056a.cj %cmp_macro
// ERRCHECK: %compiler %f %cmp_macro


macro package use

import std.ast.*
import define_20056.*
import define_20056a.*

public macro Y(attr: Tokens, input: Tokens): Tokens {
    @Z[@X[0](1)]
    @X[2](3)
}
// ASSERT: scan macro_expand_invalid_attr_tokens
