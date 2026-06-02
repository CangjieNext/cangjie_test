/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f

var a = '\u{12345678}'  // unicode scalar value must be in range '\\u{0000}' to '\\u{D7FF}' or '\\u{E000}' to '\\u{10FFFF}'
var b = '\u{00000000}'
// ASSERT: scan lex_illegal_uni_character_literal
