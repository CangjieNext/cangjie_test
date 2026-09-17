// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Arithmetic and bitwise compound assignments update tracked var values.
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

    var masked = 7
    masked &= 3
    if (masked != 3) { println("unreachable and assignment") }

    var combined = 1
    combined |= 2
    if (combined != 3) { println("unreachable or assignment") }

    var toggled = 3
    toggled ^= 1
    if (toggled != 2) { println("unreachable xor assignment") }

    var shifted = 1
    shifted <<= 2
    if (shifted != 4) { println("unreachable shift assignment") }
}

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_compound_assignment_conditions.cj:13:21:
   | 
13 |     if (added != 3) { println("unreachable addition assignment") }
   |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_compound_assignment_conditions.cj:17:26:
   | 
17 |     if (subtracted != 1) { println("unreachable subtraction assignment") }
   |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_compound_assignment_conditions.cj:21:26:
   | 
21 |     if (multiplied != 6) { println("unreachable multiplication assignment") }
   |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_compound_assignment_conditions.cj:25:23:
   | 
25 |     if (divided != 4) { println("unreachable division assignment") }
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_compound_assignment_conditions.cj:29:25:
   | 
29 |     if (remainder != 2) { println("unreachable remainder assignment") }
   |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_compound_assignment_conditions.cj:33:22:
   | 
33 |     if (masked != 3) { println("unreachable and assignment") }
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_compound_assignment_conditions.cj:37:24:
   | 
37 |     if (combined != 3) { println("unreachable or assignment") }
   |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_compound_assignment_conditions.cj:41:23:
   | 
41 |     if (toggled != 2) { println("unreachable xor assignment") }
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_compound_assignment_conditions.cj:45:23:
   | 
45 |     if (shifted != 4) { println("unreachable shift assignment") }
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
