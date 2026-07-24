// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify logical-not, and, or and inequality propagation.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
    let truth = true
    if (!truth) { println("unreachable logical not") }

    let oneFalse = false
    if (truth && oneFalse) { println("unreachable logical and") }

    if (oneFalse || oneFalse) { println("unreachable logical or") }

    let zero = 0
    if (zero != 0) { println("unreachable inequality") }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> logical_conditions.cj:13:17:
   | 
13 |     if (!truth) { println("unreachable logical not") }
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> logical_conditions.cj:16:28:
   | 
16 |     if (truth && oneFalse) { println("unreachable logical and") }
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> logical_conditions.cj:18:31:
   | 
18 |     if (oneFalse || oneFalse) { println("unreachable logical or") }
   |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> logical_conditions.cj:21:20:
   | 
21 |     if (zero != 0) { println("unreachable inequality") }
   |                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/
