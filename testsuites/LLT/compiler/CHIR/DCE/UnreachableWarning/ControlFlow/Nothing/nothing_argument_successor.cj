// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a Nothing argument makes the remaining arguments and following code unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func stop(): Nothing {
    throw Exception()
}

func consume(first: Int64, second: Int64, third: Int64) {
    if (first + second + third < 0) {
        return
    }
}

func unreachedArgument(): Int64 { 1 }

func firstArgument(): Int64 { 1 }

main(): Int64 {
    consume(firstArgument(), unreachedArgument(), 0)
    consume(firstArgument(), stop(), unreachedArgument())
    println("unreachable after argument evaluation")
    0
}

/* SCAN
warning: unreachable expression
  ==> nothing_argument_successor.cj:26:38:
   | 
26 |     consume(firstArgument(), stop(), unreachedArgument())
   |                              ~~~~~~  ^^^^^^^^^^^^^^^^^^^ unreachable expression
   |                              |
   |                              any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_successor.cj:27:5:
   | 
26 |     consume(firstArgument(), stop(), unreachedArgument())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
27 |     println("unreachable after argument evaluation")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
