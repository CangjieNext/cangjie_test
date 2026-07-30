// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify left-to-right Nothing argument evaluation and outer-call continuations.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func stop(): Nothing {
    throw Exception()
}

func consume(first: Int64, second: Int64, third: Int64) {
    if (first + second + third < 0) {
        return
    }
}

func consume(value: Int64) {
    if (value < 0) {
        return
    }
}

func firstUnreachedArgument(): Int64 { 1 }
func secondUnreachedArgument(): Int64 { 2 }
func value(): Int64 { 1 }

func firstNothingArgument(): Int64 {
    consume(stop(), firstUnreachedArgument(), secondUnreachedArgument())
    println("unreachable after first Nothing argument")
    0
}

func middleNothingArgument(): Int64 {
    consume(value(), stop(), firstUnreachedArgument())
    println("unreachable after middle Nothing argument")
    0
}

func lastNothingArgument(): Int64 {
    consume(value(), value(), stop())
    println("unreachable after last Nothing argument")
    0
}

func throwNothingArgument(): Int64 {
    consume(value(), throw Exception(), firstUnreachedArgument())
    println("unreachable after throw argument")
    0
}

main() {
    consume(0, 0, 0)
    consume(0)
    firstUnreachedArgument()
    secondUnreachedArgument()
    value()
    firstNothingArgument()
    middleNothingArgument()
    lastNothingArgument()
    throwNothingArgument()
}

/* SCAN
warning: unreachable expression
  ==> nothing_argument_evaluation.cj:31:21:
   | 
31 |     consume(stop(), firstUnreachedArgument(), secondUnreachedArgument())
   |             ~~~~~~  ^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   |             |
   |             any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:32:5:
   | 
31 |     consume(stop(), firstUnreachedArgument(), secondUnreachedArgument())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
32 |     println("unreachable after first Nothing argument")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:37:30:
   | 
37 |     consume(value(), stop(), firstUnreachedArgument())
   |                      ~~~~~~  ^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   |                      |
   |                      any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:38:5:
   | 
37 |     consume(value(), stop(), firstUnreachedArgument())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
38 |     println("unreachable after middle Nothing argument")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:44:5:
   | 
43 |     consume(value(), value(), stop())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
44 |     println("unreachable after last Nothing argument")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:49:41:
   | 
49 |     consume(value(), throw Exception(), firstUnreachedArgument())
   |                      ~~~~~~~~~~~~~~~~~  ^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   |                      |
   |                      any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:50:5:
   | 
49 |     consume(value(), throw Exception(), firstUnreachedArgument())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
50 |     println("unreachable after throw argument")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

7 warnings generated, 7 warnings printed.
*/
