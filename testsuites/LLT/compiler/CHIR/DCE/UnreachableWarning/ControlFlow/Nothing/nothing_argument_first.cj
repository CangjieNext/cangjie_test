// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify only the first argument after a Nothing argument is reported.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func stop(): Nothing {
    throw Exception()
}

func consume(first: Int64, second: Int64, third: Int64) {
    if (first + second + third < 0) {
        return
    }
}

func firstUnreachedArgument(): Int64 { 1 }
func secondUnreachedArgument(): Int64 { 2 }

main(): Int64 {
    consume(firstUnreachedArgument(), secondUnreachedArgument(), 0)
    consume(stop(), firstUnreachedArgument(), secondUnreachedArgument())
    println("unreachable after argument evaluation")
    0
}

/* SCAN
warning: unreachable expression
  ==> nothing_argument_first.cj:25:21:
   | 
25 |     consume(stop(), firstUnreachedArgument(), secondUnreachedArgument())
   |             ~~~~~~  ^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   |             |
   |             any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_first.cj:26:5:
   | 
25 |     consume(stop(), firstUnreachedArgument(), secondUnreachedArgument())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
26 |     println("unreachable after argument evaluation")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
