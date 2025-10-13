// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: M1 M2 p2
// EXEC: %compiler %compile_lib_opt -p M1/p1 %mod_name_opt M1 -o M1/p1.%middle
// EXEC: %compiler %compile_lib_opt -p M2/p1 %mod_name_opt M2 -o M2/p1.%middle
// EXEC: %compiler %compile_lib_opt -p p2 -o p2.%middle
// EXEC: %compiler %cmp_opt M1/p1.%middle M2/p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

import M1.p1 as A
internal import p2.foo as f2

main() {
    A.f1()
    p1.f1()
    f2()
    foo()
    p2.foo()
    0
}

/* SCAN
error: undeclared identifier 'p1'
  ==> main.cj:18:5:
   | 
18 |     p1.f1()
   |     ^ 
   | 

error: undeclared identifier 'foo'
  ==> main.cj:20:5:
   | 
20 |     foo()
   |     ^ 
   | 

error: undeclared identifier 'p2'
  ==> main.cj:21:5:
   | 
21 |     p2.foo()
   |     ^ 
   | 

3 errors generated, 3 errors printed.
*/
