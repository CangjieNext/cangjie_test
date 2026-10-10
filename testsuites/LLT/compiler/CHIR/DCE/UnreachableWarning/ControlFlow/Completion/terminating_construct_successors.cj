// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify successors of all-terminating if, match, and try/catch expressions.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

func returnsEveryBranch(value: Bool): Int64 {
    if (value) { return 1 } else { return 2 }
    println("unreachable after all-return if")
    return 3
}

func matchThrows(value: Bool) {
    match (value) { case true => throw Exception(); case false => throw Exception() }
    println("unreachable after all-throw match")
    println("also unreachable after all-throw match")
}

func catchesThrow() {
    try { throw Exception() } catch (_: Exception) { throw Exception() }
    println("unreachable after all-throw try")
    println("also unreachable after all-throw try")
}

main() {
    returnsEveryBranch(true)
    try { matchThrows(true) } catch (_: Exception) {}
    try { catchesThrow() } catch (_: Exception) {}
}

/* SCAN-IN
warning: unreachable expression
  ==> terminating_construct_successors.cj:13:5:
   | 
12 |     if (value) { return 1 } else { return 2 }
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
13 |     println("unreachable after all-return if")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> terminating_construct_successors.cj:19:5:
   | 
18 |     match (value) { case true => throw Exception(); case false => throw Exception() }
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
19 |     println("unreachable after all-throw match")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> terminating_construct_successors.cj:25:5:
   | 
24 |     try { throw Exception() } catch (_: Exception) { throw Exception() }
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
25 |     println("unreachable after all-throw try")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
