// LEVEL: 0
// EXEC-PIPE-1: %frontendCompiler %cmp_macro %noColor %f 2>&1 | compare %f

macro package view
internal import std.ast.*

public macro test(input: Tokens):Tokens {
    let a: Tokens = quote(\)  
    
    return input
}

/* SCAN-IN
error: unclosed delimiter: '('
  ==> test_macro_quote9.cj:30:2:
   | 
8  |     let a: Tokens = quote(\)  
   |                          ~ to match this opening '('
9  |     
   | ...
30 | 
   |  ^ expected ')' here
   | 
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

