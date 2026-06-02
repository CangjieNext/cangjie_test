// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

internal import test.*

class A {
    public var a = 1
    struct b {} 
}

class B {
    public var a = 1
    public @callTest
    struct c {} 
}

main(): Int64 {
    return 0
}

/* SCAN
error: unexpected struct declaration in class body
 ==> class_body_illegal.cj:9:5:
  | 
7 | class A {
  | ~~~~~ in class
8 |     public var a = 1
9 |     struct b {} 
  |     ^^^^^^ unexpected struct declaration
  | 

error: expected no modifier before macro call, found 'public'
  ==> class_body_illegal.cj:14:5:
   | 
14 |     public @callTest
   |     ^^^^^^ ~~~~~~~~~ before macro call
   |     |
   |     expected no modifier here
   | 

error: unexpected struct declaration in class body
  ==> class_body_illegal.cj:15:5:
   | 
12 | class B {
   | ~~~~~ in class
13 |     public var a = 1
   | ...
15 |     struct c {} 
   |     ^^^^^^ unexpected struct declaration
   | 

3 errors generated, 3 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

