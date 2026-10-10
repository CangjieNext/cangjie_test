// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Immutable local arithmetic, logical, and range facts reach branch analysis.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let first = 2
    let shifted = first + 3
    if (shifted < 0) {
        println("unreachable let arithmetic")
    }

    let left = 3
    let right = 4
    let total = left + right
    if (total == 7) {
        println("reachable let sum")
    } else {
        println("unreachable let sum else")
    }

    let truth = true
    if (!truth) {
        println("unreachable logical not")
    }

    let oneFalse = false
    if (truth && oneFalse) {
        println("unreachable logical and")
    }

    if (oneFalse || oneFalse) {
        println("unreachable logical or")
    }

    let zero = 0
    if (zero != 0) {
        println("unreachable inequality")
    }

    let limit = 10
    if (limit > 100) {
        println("unreachable let comparison")
    }

    if (limit > 0) {
        if (limit < 0) {
            println("unreachable range contradiction")
        }
    }
}

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> let_value_flow_conditions.cj:13:22:
   | 
13 |       if (shifted < 0) {
   |  ______________________^
14 | |         println("unreachable let arithmetic")
15 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> let_value_flow_conditions.cj:22:12:
   | 
22 |       } else {
   |  ____________^
23 | |         println("unreachable let sum else")
24 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> let_value_flow_conditions.cj:27:17:
   | 
27 |       if (!truth) {
   |  _________________^
28 | |         println("unreachable logical not")
29 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> let_value_flow_conditions.cj:32:28:
   | 
32 |       if (truth && oneFalse) {
   |  ____________________________^
33 | |         println("unreachable logical and")
34 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> let_value_flow_conditions.cj:36:31:
   | 
36 |       if (oneFalse || oneFalse) {
   |  _______________________________^
37 | |         println("unreachable logical or")
38 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> let_value_flow_conditions.cj:41:20:
   | 
41 |       if (zero != 0) {
   |  ____________________^
42 | |         println("unreachable inequality")
43 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> let_value_flow_conditions.cj:46:22:
   | 
46 |       if (limit > 100) {
   |  ______________________^
47 | |         println("unreachable let comparison")
48 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> let_value_flow_conditions.cj:51:24:
   | 
51 |           if (limit < 0) {
   |  ________________________^
52 | |             println("unreachable range contradiction")
53 | |         }
   | |_________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
