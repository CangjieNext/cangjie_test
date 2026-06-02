// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pkg %compile_lib_opt -o ./pkg.%middle
// ERRCHECK: %compiler %noColor pkg.%middle %f

internal import pkg.a as b
internal import pkg.b

main() {
    return a
}

/* SCAN
error: 'b' is not accessible in package 'pkg'
  ==> main.cj:12:17:
   | 
12 | internal import pkg.b
   |                 ^^^^^ 
   | 

warning: imported decl 'b' is conflicted with other import
  ==> main.cj:12:21:
   | 
12 | internal import pkg.b
   |                     ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff package-import`
note: The previous was imported here
  ==> main.cj:11:26:
   | 
11 | internal import pkg.a as b
   |                          ^ 
   | 

1 error generated, 1 error printed.
1 warning generated, 1 warning printed.
*/
