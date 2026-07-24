// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify the successor of an all-throw try/catch is unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func catchesThrow() {
    try { throw Exception() } catch (_: Exception) { throw Exception() }
    println("unreachable after all-throw try")
    println("also unreachable after all-throw try")
}

main() {
    catchesThrow()
}

/* SCAN
warning: unreachable expression
  ==> try_catch_all_throw.cj:12:5:
   | 
11 |     try { throw Exception() } catch (_: Exception) { throw Exception() }
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
12 |     println("unreachable after all-throw try")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
