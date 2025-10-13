// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg01 pkg02
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pkg01 -o pkg01.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pkg02 -o pkg02.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %f  2>&1 | compare %f

public import pkg02.*

main() {
    return A
}

/* SCAN
error: ambiguous use of 'A'
  ==> pkg.cj:15:12:
   | 
15 |     return A
   |            ^ 
   | 
note: found imported candidate
  ==> pkg.cj:12:1:
   | 
12 | public import pkg02.*
   | ^^^^^^^^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
