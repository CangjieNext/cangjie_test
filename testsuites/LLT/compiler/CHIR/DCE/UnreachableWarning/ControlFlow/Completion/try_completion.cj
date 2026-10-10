// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify terminal and normal completion paths through try/catch/finally.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func returnWithFinally(): Int64 {
    try { return 1 } finally { println("cleanup") }
    // EXPECT: chir_dce_unreachable_expression_hint
    println("unreachable after all-return try-finally")
    return 2
}

func normalTryFinallyReturn(): Int64 {
    try {
        println("try body")
    } finally {
        return 1
    }
    // EXPECT: chir_dce_unreachable_expression_hint
    println("unreachable after finally return")
    println("also unreachable after finally return")
    return 2
}

func normalTryFinallyThrow() {
    try {
        println("try body")
    } finally {
        throw Exception()
    }
    // EXPECT: chir_dce_unreachable_expression_hint
    println("unreachable after finally throw")
    println("also unreachable after finally throw")
}

func catchCompletesNormally() {
    try {
        throw Exception()
    } catch (_: Exception) {
        println("handled")
    } finally {
        println("cleanup")
    }
    println("reachable after try-catch-finally")
}

main() {
    returnWithFinally()
    normalTryFinallyReturn()
    normalTryFinallyThrow()
    catchCompletesNormally()
}

/* SCAN-IN
warning: unreachable expression
  ==> try_completion.cj:13:5:
   | 
11 |     try { return 1 } finally { println("cleanup") }
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
12 |     // EXPECT: chir_dce_unreachable_expression_hint
13 |     println("unreachable after all-return try-finally")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> try_completion.cj:24:5:
   | 
21 |         return 1
   |         ~~~~~~~~ any code following this expression is unreachable
22 |     }
   | ...
24 |     println("unreachable after finally return")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> try_completion.cj:36:5:
   | 
33 |         throw Exception()
   |         ~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
34 |     }
   | ...
36 |     println("unreachable after finally throw")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
