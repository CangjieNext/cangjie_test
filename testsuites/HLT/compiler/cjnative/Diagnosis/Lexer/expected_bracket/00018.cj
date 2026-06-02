/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

var a ='aaaaa'
var b = 'a\u{123}'
var c = '\u{123}a'
var d = '\u{123}\u{123}'
var e = '\n '
var f = '\ n '
var g = '\u{1 2 3}'
var h = '\\\\'
// ASSERT: scan lex_unrecognized_escape
// ASSERT: scan lex_expected_right_bracket_or_hexadecimal
