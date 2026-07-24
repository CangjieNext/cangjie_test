// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify bitwise compound assignments update the propagated value.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
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

/* SCAN
warning: unreachable block in 'if' expression
  ==> var_bitwise_assignment_conditions.cj:14:22:
   | 
14 |     if (masked != 3) { println("unreachable and assignment") }
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> var_bitwise_assignment_conditions.cj:18:24:
   | 
18 |     if (combined != 3) { println("unreachable or assignment") }
   |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> var_bitwise_assignment_conditions.cj:22:23:
   | 
22 |     if (toggled != 2) { println("unreachable xor assignment") }
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> var_bitwise_assignment_conditions.cj:26:23:
   | 
26 |     if (shifted != 4) { println("unreachable shift assignment") }
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/
