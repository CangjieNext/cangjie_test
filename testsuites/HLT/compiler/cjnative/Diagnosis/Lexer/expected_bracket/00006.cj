/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f

var a1 = '\u{0xffff}'
var a2 = '\u{0'
var a3 = '\u{'
var a4 = '\u{000000000'
var a5 = '\u{0000000'
// ASSERT: scan lex_expected_right_bracket_or_hexadecimal
// ASSERT: scan lex_expected_digit
