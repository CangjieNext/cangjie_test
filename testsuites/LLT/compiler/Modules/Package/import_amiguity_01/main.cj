// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1.cj pkg2.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2.cj -o pkg2.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1.cj -o pkg1.%middle
// ERRCHECK: %compiler %cmp_opt pkg1.%middle pkg2.%middle %n.cj -o %output

import pkg1.*
import pkg2.*

main() {
    let a: A
    let b: String
}

/* SCAN
error: ambiguous use of 'A'
  ==> main.cj:16:12:
   | 
16 |     let a: A
   |            ^ 
   | 
note: found imported candidate
  ==> main.cj:12:1:
   | 
12 | import pkg1.*
   | ^^^^^^^^^^^^^ 
   | 
note: found imported candidate
  ==> main.cj:13:1:
   | 
13 | import pkg2.*
   | ^^^^^^^^^^^^^ 
   | 

error: ambiguous use of 'String'
  ==> main.cj:17:12:
   | 
17 |     let b: String
   |            ^^^^^^ 
   | 
   # note: found candidate from implicit imported pacakge 'std.core'
note: found imported candidate
  ==> main.cj:13:1:
   | 
13 | import pkg2.*
   | ^^^^^^^^^^^^^ 
   | 

warning: unused import 'pkg1.*'
  ==> main.cj:12:1:
   | 
12 | import pkg1.*
   | ^^^^^^^^^^^^^ unused import
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused import 'pkg2.*'
  ==> main.cj:13:1:
   | 
13 | import pkg2.*
   | ^^^^^^^^^^^^^ unused import
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 errors generated, 2 errors printed.
2 warnings generated, 2 warnings printed.
*/
