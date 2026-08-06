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
        println("unreachable do while")
    } while (true)
}

func whileReturn(): Int64 {
    while (true) {
        return 1
        return 2
    }
    return 3
}

func forThrow() {
    for (_ in 0..1) {
        throw Exception()
        println("unreachable for throw")
    }
}

func forBreak() {
    for (_ in 0..1) {
        break
        println("unreachable for break")
    }
}

func continueInFor() {
    for (_ in 0..1) {
        continue
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

/* SCAN
warning: unreachable expression
  ==> nothing_loop.cj:14:9:
   | 
13 |         break
   |         ~~~~~ any code following this expression is unreachable
14 |         println("unreachable do while")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_loop.cj:21:9:
   | 
20 |         return 1
   |         ~~~~~~~~ any code following this expression is unreachable
21 |         return 2
   |         ^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_loop.cj:29:9:
   | 
28 |         throw Exception()
   |         ~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
29 |         println("unreachable for throw")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_loop.cj:36:9:
   | 
35 |         break
   |         ~~~~~ any code following this expression is unreachable
36 |         println("unreachable for break")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_loop.cj:43:9:
   | 
42 |         continue
   |         ~~~~~~~~ any code following this expression is unreachable
43 |         println("unreachable continue")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

5 warnings generated, 5 warnings printed.
*/
