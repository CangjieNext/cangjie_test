// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Nothing calls, throws, and returns report the first sequential successor.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func stop(): Nothing {
    throw Exception()
}

func nothingCallSuccessor(): Int64 {
    stop()
    println("unreachable after Nothing call")
    0
}

func catchThrow() {
    try {
        throw Exception()
    } catch (error: Exception) {
        throw error
        println("unreachable catch")
    }
}

func consecutiveReturns(): Int64 {
    return 1
    return 2
    return 3
}

main() {
    nothingCallSuccessor()
    catchThrow()
    println(consecutiveReturns())
}

/* SCAN
warning: unreachable expression
  ==> nothing_sequential_successors.cj:16:5:
   | 
15 |     stop()
   |     ~~~~~~ any code following this expression is unreachable
16 |     println("unreachable after Nothing call")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_sequential_successors.cj:25:9:
   | 
24 |         throw error
   |         ~~~~~~~~~~~ any code following this expression is unreachable
25 |         println("unreachable catch")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_sequential_successors.cj:31:5:
   | 
30 |     return 1
   |     ~~~~~~~~ any code following this expression is unreachable
31 |     return 2
   |     ^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
