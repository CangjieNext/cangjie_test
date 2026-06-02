// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1.cj pkg2.cj pkg3.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2.cj -o pkg2.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg3.cj -o pkg3.%middle
// ERRCHECK: %compiler %cmp_opt %f 

internal import pkg2.*
internal import pkg3.*

main() {
    let v: A // should report confliction. pkg2.A is not reexported in current package
}

/* SCAN
error: ambiguous use of 'A'
  ==> main.cj:17:12:
   | 
17 |     let v: A // should report confliction. pkg2.A is not reexported in current package
   |            ^ 
   | 
note: found imported candidate
  ==> main.cj:13:1:
   | 
13 | internal import pkg2.*
   | ^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: found imported candidate
  ==> main.cj:14:1:
   | 
14 | internal import pkg3.*
   | ^^^^^^^^^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
