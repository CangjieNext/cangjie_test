// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

internal import test.*

func test1() {
    struct a {} 
    @callTest
    struct b {} 
}

func test2() {
    class a {} 
}

func test3() {
    @callTest
    class b {} 
}

main() {
    return 0
}

/* SCAN
error: unexpected struct declaration in function body
 ==> func_body_illegal.cj:8:5:
  | 
7 | func test1() {
  | ~~~~ in function
8 |     struct a {} 
  |     ^^^^^^ unexpected struct declaration
  | 

error: unexpected struct declaration in function body
  ==> func_body_illegal.cj:10:5:
   | 
7  | func test1() {
   | ~~~~ in function
8  |     struct a {} 
   | ...
10 |     struct b {} 
   |     ^^^^^^ unexpected struct declaration
   | 

error: unexpected class declaration in function body
  ==> func_body_illegal.cj:14:5:
   | 
13 | func test2() {
   | ~~~~ in function
14 |     class a {} 
   |     ^^^^^ unexpected class declaration
   | 

error: unexpected class declaration in function body
  ==> func_body_illegal.cj:19:5:
   | 
17 | func test3() {
   | ~~~~ in function
18 |     @callTest
19 |     class b {} 
   |     ^^^^^ unexpected class declaration
   | 

4 errors generated, 4 errors printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
