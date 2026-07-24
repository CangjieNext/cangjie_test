// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a Nothing-returning call makes the following sequential region unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func stop(): Nothing {
    throw Exception()
}

main(): Int64 {
    stop()
    println("unreachable after Nothing call")
    0
}

/* SCAN
warning: unreachable expression
  ==> nothing_call_successor.cj:16:5:
   | 
15 |     stop()
   |     ~~~~~~ any code following this expression is unreachable
16 |     println("unreachable after Nothing call")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
