// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

internal import test.*

struct A {
    struct b {}  
}

struct B {
    public @callTest
    struct c {}  
}

main(): Int64 {
    return 0
}

/* SCAN
error: unexpected struct declaration in struct body
 ==> record_body_illegal.cj:8:5:
  | 
7 | struct A {
  | ~~~~~~ in struct
8 |     struct b {}  
  |     ^^^^^^ unexpected struct declaration
  | 

error: expected no modifier before macro call, found 'public'
  ==> record_body_illegal.cj:12:5:
   | 
12 |     public @callTest
   |     ^^^^^^ ~~~~~~~~~ before macro call
   |     |
   |     expected no modifier here
   | 

error: unexpected struct declaration in struct body
  ==> record_body_illegal.cj:13:5:
   | 
11 | struct B {
   | ~~~~~~ in struct
12 |     public @callTest
13 |     struct c {}  
   |     ^^^^^^ unexpected struct declaration
   | 

3 errors generated, 3 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

