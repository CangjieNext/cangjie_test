// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

internal import test.*

main(): Int64 {
    struct DataA { 
        var b: Int64 = 0
    }
    return 0
}

/* SCAN
error: unexpected struct declaration in main function body
 ==> record_decl_illegal.cj:8:5:
  | 
7 | main(): Int64 {
  | ~~~~ in main function
8 |     struct DataA { 
  |     ^^^^^^ unexpected struct declaration
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

