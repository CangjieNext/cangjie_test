// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify constant arithmetic and bitwise expressions propagate into conditions.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
    const base = 2
    const chained = base + 5
    if (chained < 0) { println("unreachable const chain") }

    const difference = 2 - 5
    if (difference > 0) { println("unreachable const subtraction") }

    const product = 2 * 3
    if (product < 0) { println("unreachable const multiplication") }

    const quotient = 8 / 2
    if (quotient != 4) { println("unreachable const division") }

    const modulo = 8 % 3
    if (modulo != 2) { println("unreachable const remainder") }

    const bitwise = (7 & 3) | (1 << 2)
    if (bitwise != 7) { println("unreachable const bitwise expression") }

    const toggled = bitwise ^ 7
    if (toggled != 0) { println("unreachable const xor expression") }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> const_arithmetic_conditions.cj:14:22:
   | 
14 |     if (chained < 0) { println("unreachable const chain") }
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> const_arithmetic_conditions.cj:17:25:
   | 
17 |     if (difference > 0) { println("unreachable const subtraction") }
   |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> const_arithmetic_conditions.cj:20:22:
   | 
20 |     if (product < 0) { println("unreachable const multiplication") }
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> const_arithmetic_conditions.cj:23:24:
   | 
23 |     if (quotient != 4) { println("unreachable const division") }
   |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> const_arithmetic_conditions.cj:26:22:
   | 
26 |     if (modulo != 2) { println("unreachable const remainder") }
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> const_arithmetic_conditions.cj:29:23:
   | 
29 |     if (bitwise != 7) { println("unreachable const bitwise expression") }
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> const_arithmetic_conditions.cj:32:23:
   | 
32 |     if (toggled != 0) { println("unreachable const xor expression") }
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

7 warnings generated, 7 warnings printed.
*/
