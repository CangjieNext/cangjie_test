// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Direct, named, and scalar const values select the corresponding if branch.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    if (true) {
        println("reachable true branch")
    } else {
        println("unreachable true else")
    }

    if (false) {
        println("unreachable false then")
    } else {
        println("reachable false branch")
    }

    const enabled = true
    if (enabled) {
        println("reachable const branch")
    } else {
        println("unreachable const else")
    }

    const threshold = 10
    if (threshold > 100) {
        println("unreachable const comparison")
    }

    const negative = -1
    if (negative >= 0) { println("unreachable const unary negative") }

    const letter = r'a'
    if (letter != r'a') { println("unreachable const rune") }

    const ratio: Float64 = 1.0
    if (ratio > 2.0) { println("unreachable const float") }
}

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> const_value_conditions.cj:13:12:
   | 
13 |       } else {
   |  ____________^
14 | |         println("unreachable true else")
15 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> const_value_conditions.cj:17:16:
   | 
17 |       if (false) {
   |  ________________^
18 | |         println("unreachable false then")
19 | |     } else {
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> const_value_conditions.cj:26:12:
   | 
26 |       } else {
   |  ____________^
27 | |         println("unreachable const else")
28 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> const_value_conditions.cj:31:26:
   | 
31 |       if (threshold > 100) {
   |  __________________________^
32 | |         println("unreachable const comparison")
33 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> const_value_conditions.cj:36:24:
   | 
36 |     if (negative >= 0) { println("unreachable const unary negative") }
   |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> const_value_conditions.cj:39:25:
   | 
39 |     if (letter != r'a') { println("unreachable const rune") }
   |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> const_value_conditions.cj:42:22:
   | 
42 |     if (ratio > 2.0) { println("unreachable const float") }
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
