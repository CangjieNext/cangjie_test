// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

internal import test.*

main(): Int64 {
    public var a =1 
    @callTest
    public var b =1 
    return 0
}

/* SCAN
error: unexpected modifier 'public' on variable declaration in main function body
 ==> var_decl_illegal.cj:8:5:
  | 
7 | main(): Int64 {
  | ~~~~ in main function
8 |     public var a =1 
  |     ^^^^^^ ~~~ on variable declaration
  |     |
  |     unexpected modifier
  | 

error: unexpected modifier 'public' on variable declaration in main function body
  ==> var_decl_illegal.cj:10:5:
   | 
7  | main(): Int64 {
   | ~~~~ in main function
8  |     public var a =1 
   | ...
10 |     public var b =1 
   |     ^^^^^^ ~~~ on variable declaration
   |     |
   |     unexpected modifier
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
