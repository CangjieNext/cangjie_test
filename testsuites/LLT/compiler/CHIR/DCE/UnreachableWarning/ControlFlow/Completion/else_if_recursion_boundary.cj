// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify that a multi-level else-if chain reports only directly unreachable successors.
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



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

/* SCAN
warning: unreachable block in 'if' expression
  ==> else_if_recursion_boundary.cj:13:16:
   | 
13 |       if (false) {
   |  ________________^
14 | |         println("outer then")
15 | |     } else if (true) {
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> else_if_recursion_boundary.cj:17:12:
   | 
17 |       } else if (false) {
   |  ____________^
18 | |         println("nested then")
   | | ...
21 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
