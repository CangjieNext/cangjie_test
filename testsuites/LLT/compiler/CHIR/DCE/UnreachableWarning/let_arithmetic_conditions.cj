// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify arithmetic propagation through let bindings.
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
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> let_arithmetic_conditions.cj:14:22:
   | 
14 |       if (shifted < 0) {
   |  ______________________^
15 | |         println("unreachable let arithmetic")
16 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> let_arithmetic_conditions.cj:23:12:
   | 
23 |       } else {
   |  ____________^
24 | |         println("unreachable let sum else")
25 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
