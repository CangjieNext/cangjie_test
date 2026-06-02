/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-1: %compiler %cmp_opt %f -o %output 2>&1 

macro papackage define

import std.ast

public macro M(input:Tokens){
   eturn ickage define

import std.ast

public macro M(input:Tokens){
   eturn!input
}

/* SCAN
error: unexpected macro declaration in macro body
  ==> regression_fuzz_0041.cj:14:8:
   | 
9  | public macro M(input:Tokens){
   |        ~~~~~ in macro
10 |    eturn ickage define
   | ...
14 | public macro M(input:Tokens){
   |        ^^^^^ unexpected macro declaration
   | 

regression_fuzz_0041.cj:5:1: error: expected 'public' modifier before 'macro'
    5 | macro papackage define
      | ^
regression_fuzz_0041.cj:5:7: error: macro declaration must have macro body
    5 | macro papackage define
      |       ^
regression_fuzz_0041.cj:5:17: error: expected function parameters after function name
    5 | macro papackage define
      |                 ^
regression_fuzz_0041.cj:10:10: error: expected newline or ';' between expression or declaration
   10 |    eturn ickage define
      |          ^
regression_fuzz_0041.cj:12:1: error: 'from' is not allowed in block, expected expression or declaration here
   12 | import std.ast
      | ^
regression_fuzz_0041.cj:15:10: error: expected newline or ';' between expression or declaration
   15 |    eturn!input
      |          ^
regression_fuzz_0041.cj:16:1: error: '}' is not allowed in block, expected expression or declaration here
   16 | }
      | ^
regression_fuzz_0041.cj:16:2: error: expected '}'
   16 | }
      |  ^
regression_fuzz_0041.cj:9:29: note: to match this '{'
    9 | public macro M(input:Tokens){
      |                             ^
9 errors generated, 9 errors printed.
*/
// ASSERT: regex-not no position error occurred
