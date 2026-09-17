// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify Nothing successors in loop bodies.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func doWhileBreak() {
    do {
        break
        // EXPECT: chir_dce_unreachable_expression_hint
        println("unreachable do while")
    } while (true)
}

func whileReturn(): Int64 {
    while (true) {
        return 1
        // EXPECT: chir_dce_unreachable_expression_hint
        return 2
    }
    return 3
}

func forThrow() {
    for (_ in 0..1) {
        throw Exception()
        // EXPECT: chir_dce_unreachable_expression_hint
        println("unreachable for throw")
    }
}

func forBreak() {
    for (_ in 0..1) {
        break
        // EXPECT: chir_dce_unreachable_expression_hint
        println("unreachable for break")
    }
}

func continueInFor() {
    for (_ in 0..1) {
        continue
        // EXPECT: chir_dce_unreachable_expression_hint
        println("unreachable continue")
    }
}

main() {
    doWhileBreak()
    println(whileReturn())
    forThrow()
    forBreak()
    continueInFor()
}

/* SCAN-IN
warning: unreachable expression
  ==> nothing_loop.cj:14:9:
   | 
12 |         break
   |         ~~~~~ any code following this expression is unreachable
13 |         // EXPECT: chir_dce_unreachable_expression_hint
14 |         println("unreachable do while")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_loop.cj:22:9:
   | 
20 |         return 1
   |         ~~~~~~~~ any code following this expression is unreachable
21 |         // EXPECT: chir_dce_unreachable_expression_hint
22 |         return 2
   |         ^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_loop.cj:31:9:
   | 
29 |         throw Exception()
   |         ~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
30 |         // EXPECT: chir_dce_unreachable_expression_hint
31 |         println("unreachable for throw")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_loop.cj:39:9:
   | 
37 |         break
   |         ~~~~~ any code following this expression is unreachable
38 |         // EXPECT: chir_dce_unreachable_expression_hint
39 |         println("unreachable for break")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_loop.cj:47:9:
   | 
45 |         continue
   |         ~~~~~~~~ any code following this expression is unreachable
46 |         // EXPECT: chir_dce_unreachable_expression_hint
47 |         println("unreachable continue")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
