// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify value tracking across increment and decrement expressions.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    var incremented = 0
    incremented++
    if (incremented == 0) { println("unreachable increment") }

    var decremented = 1
    decremented--
    if (decremented != 0) { println("unreachable decrement") }
}

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_increment_decrement_conditions.cj:13:27:
   | 
13 |     if (incremented == 0) { println("unreachable increment") }
   |                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_increment_decrement_conditions.cj:17:27:
   | 
17 |     if (decremented != 0) { println("unreachable decrement") }
   |                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
