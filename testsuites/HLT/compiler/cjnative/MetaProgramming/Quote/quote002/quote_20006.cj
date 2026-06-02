/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_macro %f


macro package define
import std.ast.*
// bad case for hex literal
public macro test(input:Tokens):Tokens{
    quote(-0_x0)
    quote(0x_1) 
    quote(0x_) 
    quote(0xg) 
    quote(00x0)
    quote(0x) 
}
// ASSERT: scan lex_unknown_suffix
// ASSERT: scan lex_expected_digit
// ASSERT: scan lex_cannot_start_with_digit
