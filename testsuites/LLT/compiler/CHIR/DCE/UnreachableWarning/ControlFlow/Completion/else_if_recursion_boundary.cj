// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify that a multi-level else-if chain reports each unreachable sibling body.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    if (false) {
        println("outer then")
    } else if (true) {
        println("reachable")
    } else if (false) {
        println("nested then")
    } else {
        println("nested else")
    }
}

// ASSERT: scan-3 warning: unreachable block in 'if' expression

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> else_if_recursion_boundary.cj:11:16:
   | 
11 |       if (false) {
   |  ________________^
12 | |         println("outer then")
13 | |     } else if (true) {
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> else_if_recursion_boundary.cj:15:23:
   | 
15 |       } else if (false) {
   |  _______________________^
16 | |         println("nested then")
17 | |     } else {
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> else_if_recursion_boundary.cj:17:12:
   | 
17 |       } else {
   |  ____________^
18 | |         println("nested else")
19 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
