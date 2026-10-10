// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify each unreachable branch body in a constant local-value else-if chain.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let x = 15
    if (x > 20) {
        println("x>20")
    } else if (x > 10) {
        println("x>10")
    } else if (x > 0) {
        println("x>0")
    } else {
        println("x<0")
    }
}

// ASSERT: scan-3 warning: unreachable block in 'if' expression

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> let_else_if_chain.cj:12:17:
   | 
12 |       if (x > 20) {
   |  _________________^
13 | |         println("x>20")
14 | |     } else if (x > 10) {
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> let_else_if_chain.cj:16:23:
   | 
16 |       } else if (x > 0) {
   |  _______________________^
17 | |         println("x>0")
18 | |     } else {
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> let_else_if_chain.cj:18:12:
   | 
18 |       } else {
   |  ____________^
19 | |         println("x<0")
20 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
