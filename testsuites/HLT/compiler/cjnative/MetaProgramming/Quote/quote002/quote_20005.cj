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
// bad case for octal literal
public macro test(input:Tokens):Tokens{
    quote(-0_o0)
    quote(0o_1)  
    quote(0o_)  
    quote(0o8)  
    quote(0oa)  
    quote(00o0)
    quote(0o)  
}
// ASSERT: scan lex_unknown_suffix
// ASSERT: scan lex_expected_digit
// ASSERT: scan lex_unexpected_digit
// ASSERT: scan lex_cannot_start_with_digit
