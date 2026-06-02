// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/A.cj -o pkg1/A.%middle
// EXEC: %compiler %cmp_opt  pkg1/A.%middle %f --import-path pkg1 -o %n.%suffix 2>&1 | compare %f

internal import A.*

main(): Int64 {
    let a = C()
    let b = B()
    let c = A.B()
    let d: B
    let e: pkg1.B
    return 0
}

/* SCAN
error: undeclared type name 'B'
  ==> main.cj:17:12:
   | 
17 |     let d: B
   |            ^ 
   | 

error: undeclared type name 'pkg1'
  ==> main.cj:18:12:
   | 
18 |     let e: pkg1.B
   |            ^ 
   | 

error: undeclared type name 'B'
  ==> main.cj:18:17:
   | 
18 |     let e: pkg1.B
   |                 ^ 
   | 

error: undeclared identifier 'B'
  ==> main.cj:15:13:
   | 
15 |     let b = B()
   |             ^ 
   | 

error: undeclared identifier 'A'
  ==> main.cj:16:13:
   | 
16 |     let c = A.B()
   |             ^ 
   | 

5 errors generated, 5 errors printed.
*/
