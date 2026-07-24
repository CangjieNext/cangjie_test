// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify arithmetic compound assignments update the propagated value.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
    var added = 1
    added += 2
    if (added != 3) { println("unreachable addition assignment") }

    var subtracted = 3
    subtracted -= 2
    if (subtracted != 1) { println("unreachable subtraction assignment") }

    var multiplied = 2
    multiplied *= 3
    if (multiplied != 6) { println("unreachable multiplication assignment") }

    var divided = 8
    divided /= 2
    if (divided != 4) { println("unreachable division assignment") }

    var remainder = 8
    remainder %= 3
    if (remainder != 2) { println("unreachable remainder assignment") }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> var_arithmetic_assignment_conditions.cj:14:21:
   | 
14 |     if (added != 3) { println("unreachable addition assignment") }
   |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> var_arithmetic_assignment_conditions.cj:18:26:
   | 
18 |     if (subtracted != 1) { println("unreachable subtraction assignment") }
   |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> var_arithmetic_assignment_conditions.cj:22:26:
   | 
22 |     if (multiplied != 6) { println("unreachable multiplication assignment") }
   |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> var_arithmetic_assignment_conditions.cj:26:23:
   | 
26 |     if (divided != 4) { println("unreachable division assignment") }
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> var_arithmetic_assignment_conditions.cj:30:25:
   | 
30 |     if (remainder != 2) { println("unreachable remainder assignment") }
   |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

5 warnings generated, 5 warnings printed.
*/
