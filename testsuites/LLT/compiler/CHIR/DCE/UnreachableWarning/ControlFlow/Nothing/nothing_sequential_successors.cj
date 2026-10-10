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
    // EXPECT: chir_dce_unreachable_expression_hint
    println("unreachable after Nothing call")
    0
}

func catchThrow() {
    try {
        throw Exception()
    } catch (error: Exception) {
        throw error
        // EXPECT: chir_dce_unreachable_expression_hint
        println("unreachable catch")
    }
}

func consecutiveReturns(): Int64 {
    return 1
    // EXPECT: chir_dce_unreachable_expression_hint
    return 2
    return 3
}

main() {
    nothingCallSuccessor()
    catchThrow()
    println(consecutiveReturns())
}

/* SCAN-IN
warning: unreachable expression
  ==> nothing_sequential_successors.cj:17:5:
   | 
15 |     stop()
   |     ~~~~~~ any code following this expression is unreachable
16 |     // EXPECT: chir_dce_unreachable_expression_hint
17 |     println("unreachable after Nothing call")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_sequential_successors.cj:27:9:
   | 
23 |         throw Exception()
   |         ~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
24 |     } catch (error: Exception) {
   | ...
27 |         println("unreachable catch")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_sequential_successors.cj:34:5:
   | 
32 |     return 1
   |     ~~~~~~~~ any code following this expression is unreachable
33 |     // EXPECT: chir_dce_unreachable_expression_hint
34 |     return 2
   |     ^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
