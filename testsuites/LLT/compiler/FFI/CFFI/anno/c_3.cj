// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f -o %output 2>&1 | compare %f

macro package test

internal import std.ast.*

@C
var a = 0

@C
enum Kind {
    A | B
}

@C
type MyInt = Int64

@C
public macro A(attr: Tokens, input: Tokens): Tokens {
    input
}

main() {}

/* SCAN
error: variable cannot be modified with '@C'
 ==> c_3.cj:7:1:
  | 
7 | @C
  | ^ 
  | 

error: enum cannot be modified with '@C'
  ==> c_3.cj:10:1:
   | 
10 | @C
   | ^ 
   | 

error: type alias cannot be modified with '@C'
  ==> c_3.cj:15:1:
   | 
15 | @C
   | ^ 
   | 

error: macro cannot be modified with '@C'
  ==> c_3.cj:18:1:
   | 
18 | @C
   | ^ 
   | 

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
