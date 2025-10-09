// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// LEVEL 0
// DEPENDENCE: import.pkg.cj
// ERRCHECK: %compiler import.pkg.cj %f %compile_lib_opt %cmp_opt

package a::c

/* SCAN
error: found more than one package declaration for the package
 ==> import.pkg.cj:6:9:
  | 
6 | package a::b
  |         ^^^^ 
  | 
note: another different package declaration 'public package a::c'
  ==> diffname.cj:10:9:
   | 
10 | package a::c
   |         ^^^^ 
   | 

1 error generated, 1 error printed.
*/
