/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f

var a1 = 0b
var a2 = 0b我
var a3 = 0b
var a4 = 0b_
var a5 = 0o
var a6 = 0O我
var a7 = 0O
var a8 = 0O_
var a9 = 0x
var a10 = 0X我
var a11 = 0x
var a12 = 0X_
var a13 = 0b1
// ASSERT: scan lex_expected_digit
