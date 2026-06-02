// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_parallel %f -o %output

import test.*

@callTest(
class A {
    @VAR a = 1 // macro evaluate failed
})

@VAR
var vb = 1 // macro evaluate success

@VAR
var vc = 2 // macro evaluate success

@callTest(
struct D {
    @VAR a = 1 // macro evaluate failed
})

main(): Int64 {
    return 0
}

/* SCAN
error: expected declaration, found 'a'
 ==> var.cj:9:10:
  | 
9 |     @VAR a = 1 // macro evaluate failed
  |          ^ expected declaration here
  | 

error: expected declaration, found 'a'
  ==> var.cj:20:10:
   | 
20 |     @VAR a = 1 // macro evaluate failed
   |          ^ expected declaration here
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
