/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f

var a = '\u{}'
var b = '\u{
}'
var c = '\u{G}'
var d = '\u{g}'
var e = '\u{Z}'
var f = '\u{z}'
var g = '\u{-1}'
var h = '\u{"x"}'
// ASSERT: scan lex_expected_digit
