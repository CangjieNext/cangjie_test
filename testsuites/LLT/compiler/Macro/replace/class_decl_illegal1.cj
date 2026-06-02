// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

internal import test.*

main(): Int64 {
    @callTest
    class A{} 
    return 0
}

/* SCAN
error: unexpected class declaration in main function body
  ==> class_decl_illegal1.cj:15:5:
   | 
13 | main(): Int64 {
   | ~~~~ in main function
14 |     @callTest
15 |     class A{} 
   |     ^^^^^ unexpected class declaration
   | 

1 error generated, 1 error printed.
*/
