/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f

var a = '\u{1_2}'
var b = '\u{var}'
var c = '\u{${x}}'
var d = '\u{@x}'
var e = '\u{1z}'
// ASSERT: scan lex_expected_right_bracket_or_hexadecimal
// ASSERT: scan lex_expected_digit
