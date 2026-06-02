// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

internal import test.*

interface A{
    @callTest 
    var a:Int64 = 1
}
main(): Int64 {
    return 0
}

/* SCAN
error: unexpected variable declaration in interface body
 ==> interface_decl_illegal2.cj:9:5:
  | 
7 | interface A{
  | ~~~~~~~~~ in interface
8 |     @callTest 
9 |     var a:Int64 = 1
  |     ^^^ unexpected variable declaration
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

