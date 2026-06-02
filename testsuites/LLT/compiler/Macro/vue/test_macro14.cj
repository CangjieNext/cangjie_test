// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

macro package A

internal import std.ast.*

public macro a1(x: Tokens, y: Tokens) {
    quote(0)
}

func aaa() {
    var aa = macroCall_a_a1
    aa(0)
    macroCall_a_a1(12)
    0
}

/* SCAN
error: undeclared identifier 'macroCall_a_a1'
  ==> test_macro14.cj:12:14:
   | 
12 |     var aa = macroCall_a_a1
   |              ^ 
   | 

error: undeclared identifier 'macroCall_a_a1'
  ==> test_macro14.cj:14:5:
   | 
14 |     macroCall_a_a1(12)
   |     ^ 
   | 

error: 'main' is missing
 ==> test_macro14.cj:1:1:
  | 
1 | // EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
  | ^ 
  | 

3 errors generated, 3 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

