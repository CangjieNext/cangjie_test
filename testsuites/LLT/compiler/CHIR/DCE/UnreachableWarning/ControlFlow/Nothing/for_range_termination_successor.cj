// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a return successor in a range-for body remains an unreachable expression.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func returnThenUnreachableInRange(): Int64 {
    for (_ in 0..1) {
        return 1
        println("unreachable after range-for return")
    }
    0
}

main() {
    println(returnThenUnreachableInRange())
}

/* SCAN
warning: unreachable expression
  ==> for_range_termination_successor.cj:13:9:
   | 
12 |         return 1
   |         ~~~~~~~~ any code following this expression is unreachable
13 |         println("unreachable after range-for return")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
