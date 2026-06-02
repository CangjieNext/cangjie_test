// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

internal import test.*

interface A {
    struct a { }  
}

interface B {
    @callTest
    struct b {}  
}

main(): Int64 {
    return 0
}

/* SCAN
error: unexpected struct declaration in interface body
 ==> interface_body_illegal.cj:8:5:
  | 
7 | interface A {
  | ~~~~~~~~~ in interface
8 |     struct a { }  
  |     ^^^^^^ unexpected struct declaration
  | 

error: unexpected struct declaration in interface body
  ==> interface_body_illegal.cj:13:5:
   | 
11 | interface B {
   | ~~~~~~~~~ in interface
12 |     @callTest
13 |     struct b {}  
   |     ^^^^^^ unexpected struct declaration
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

