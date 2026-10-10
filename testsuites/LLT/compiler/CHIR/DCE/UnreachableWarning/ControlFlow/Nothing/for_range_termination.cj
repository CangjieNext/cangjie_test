// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify range-for termination CFG construction and a return successor diagnostic.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func returnFromRange(shouldReturn: Bool): Int64 {
    for (_ in 0..1) {
        if (shouldReturn) {
            return 1
        }
    }
    0
}

func returnThenUnreachableInRange(): Int64 {
    for (_ in 0..1) {
        return 1
        // EXPECT: chir_dce_unreachable_expression_hint
        println("unreachable after range-for return")
    }
    0
}

main() {
    println(returnFromRange(true))
    println(returnFromRange(false))
    println(returnThenUnreachableInRange())
}

/* SCAN-IN
warning: unreachable expression
  ==> for_range_termination.cj:23:9:
   | 
21 |         return 1
   |         ~~~~~~~~ any code following this expression is unreachable
22 |         // EXPECT: chir_dce_unreachable_expression_hint
23 |         println("unreachable after range-for return")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
