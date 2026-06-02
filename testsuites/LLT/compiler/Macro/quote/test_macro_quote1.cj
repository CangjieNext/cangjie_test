// EXEC: %frontendCompiler %typecheck %cmp_opt %f -o %output 2>&1 | compare %f

macro package view

internal import std.ast.*

public macro test(input: Tokens): Tokens {
    quote(1 + 2 + 3)
    let a: Int32 = quote(4 + 5 + 6)

    return a + quote($expr + $(1+2))
}

/* SCAN
error: mismatched types
 ==> test_macro_quote1.cj:9:20:
  | 
9 |     let a: Int32 = quote(4 + 5 + 6)
  |                    ^^^^^^^^^^^^^^^^ expected 'Int32', found 'Class-Tokens'
  | 

error: undeclared identifier 'expr'
  ==> test_macro_quote1.cj:11:23:
   | 
11 |     return a + quote($expr + $(1+2))
   |                       ^ 
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
