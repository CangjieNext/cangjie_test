// DEPENDENCE: inout_e23_dep.cj
// EXEC:%compiler %compile_lib_opt inout_e23_dep.cj -o pkg.%middle
// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor pkg.%middle %f -o %output 2>&1 | compare %f

internal import a.b.c.*

foreign func NonExist(ptr: CPointer<CFunc<() -> Int32>>): Unit

main() {
    unsafe { NonExist(inout a.b.c.f) }
    0
}

/* SCAN
error: undeclared identifier 'a'
  ==> inout_e23.cj:10:29:
   | 
10 |     unsafe { NonExist(inout a.b.c.f) }
   |                             ^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
