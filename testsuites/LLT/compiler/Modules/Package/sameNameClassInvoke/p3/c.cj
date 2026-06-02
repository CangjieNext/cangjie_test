// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p2/*.cj -o b.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle b.%middle %f -o %output 2>&1 | compare %f

package p3

internal import p1.*
internal import p2.*

main() {
    let a = C()
    return 0
}

/* SCAN
error: ambiguous use of 'C'
  ==> c.cj:18:13:
   | 
18 |     let a = C()
   |             ^ 
   | 
note: found imported candidate
  ==> c.cj:14:1:
   | 
14 | internal import p1.*
   | ^^^^^^^^^^^^^^^^^^^^ 
   | 
note: found imported candidate
  ==> c.cj:15:1:
   | 
15 | internal import p2.*
   | ^^^^^^^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
