// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify constant Boolean and comparison expressions propagate into conditions.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    const andResult = true && false
    if (andResult) { println("unreachable const and") }

    const orResult = false || false
    if (orResult) { println("unreachable const or") }

    const notResult = !true
    if (notResult) { println("unreachable const not") }

    const equal = 2 == 2
    if (!equal) { println("unreachable const equality") }

    const ordered = 1 < 2
    if (!ordered) { println("unreachable const ordering") }
}

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> const_boolean_conditions.cj:12:20:
   | 
12 |     if (andResult) { println("unreachable const and") }
   |                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> const_boolean_conditions.cj:15:19:
   | 
15 |     if (orResult) { println("unreachable const or") }
   |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> const_boolean_conditions.cj:18:20:
   | 
18 |     if (notResult) { println("unreachable const not") }
   |                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> const_boolean_conditions.cj:21:17:
   | 
21 |     if (!equal) { println("unreachable const equality") }
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> const_boolean_conditions.cj:24:19:
   | 
24 |     if (!ordered) { println("unreachable const ordering") }
   |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
