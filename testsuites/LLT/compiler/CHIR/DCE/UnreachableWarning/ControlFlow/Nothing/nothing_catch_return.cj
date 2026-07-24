// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify catch-body and consecutive-return successors.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


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
    catchThrow()
    println(consecutiveReturns())
}

/* SCAN
warning: unreachable expression
  ==> nothing_catch_return.cj:16:9:
   | 
15 |         throw error
   |         ~~~~~~~~~~~ any code following this expression is unreachable
16 |         println("unreachable catch")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_catch_return.cj:22:5:
   | 
21 |     return 1
   |     ~~~~~~~~ any code following this expression is unreachable
22 |     return 2
   |     ^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
