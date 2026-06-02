/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
var varChar1 : Rune = '\u{0}'
var varChar2 : Rune = '\u{99999999}'
var varChar3 : Rune = '\u{ffffffff}'
var varChar4 : Rune = '\u{12345678}'
var varChar5 : Rune = '\u{ABCDEF01}'
var varChar6 : Rune = '\u{01abcdef}'

let letChar1 : Rune = '\u{0}'
let letChar2 : Rune = '\u{99999999}'
let letChar3 : Rune = '\u{ffffffff}'
let letChar4 : Rune = '\u{12345678}'
let letChar5 : Rune = '\u{ABCDEF01}'
let letChar6 : Rune = '\u{01abcdef}'
return 0
}
// ASSERT: scan lex_illegal_uni_character_literal
