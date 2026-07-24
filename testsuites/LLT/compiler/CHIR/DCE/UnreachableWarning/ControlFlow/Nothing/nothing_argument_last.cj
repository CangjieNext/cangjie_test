// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a final Nothing argument has no argument-suffix warning.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func stop(): Nothing {
    throw Exception()
}

func consume(first: Int64, second: Int64, third: Int64) {
    if (first + second + third < 0) {
        return
    }
}

func value(): Int64 { 1 }

main(): Int64 {
    consume(value(), value(), value())
    consume(value(), value(), stop())
    println("unreachable after argument evaluation")
    0
}

/* SCAN
warning: unreachable expression
  ==> nothing_argument_last.cj:25:5:
   | 
24 |     consume(value(), value(), stop())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
25 |     println("unreachable after argument evaluation")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
