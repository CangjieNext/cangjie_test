// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify declaration-order Nothing argument evaluation and outer-call continuations.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func stop(): Nothing {
    throw Exception()
}

func consume(first: Int64, second: Int64, third: Int64) {
    if (first + second + third < 0) {
        return
    }
}

func consumeNamed(first!: Int64, second!: Int64, third!: Int64) {
    if (first + second + third < 0) {
        return
    }
}

func consume(value: Int64) {
    if (value < 0) {
        return
    }
}

extend Nothing {
    func consume(value: Int64) {
        if (value < 0) {
            return
        }
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

func nothingReceiver(): Int64 {
    stop().consume(value())
    println("unreachable after Nothing receiver")
    0
}

func nothingCallee(): Int64 {
    stop()(value())
    println("unreachable after Nothing callee")
    0
}

func namedArgumentDeclarationOrder(): Int64 {
    consumeNamed(third: stop(), first: value(), second: value())
    println("unreachable after declaration-order named call")
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
    nothingReceiver()
    nothingCallee()
    namedArgumentDeclarationOrder()
}

/* SCAN
warning: unused function:'consumeNamed'
  ==> nothing_argument_evaluation.cj:20:1:
   | 
20 |   func consumeNamed(first!: Int64, second!: Int64, third!: Int64) {
   |  _^
21 | |     if (first + second + third < 0) {
   | | ...
24 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused function:'consume'
  ==> nothing_argument_evaluation.cj:33:5:
   | 
33 |       func consume(value: Int64) {
   |  _____^
34 | |         if (value < 0) {
   | | ...
37 | |     }
   | |_____^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'value'
  ==> nothing_argument_evaluation.cj:33:18:
   | 
33 |     func consume(value: Int64) {
   |                  ^^^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:45:21:
   | 
45 |     consume(stop(), firstUnreachedArgument(), secondUnreachedArgument())
   |             ~~~~~~  ^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   |             |
   |             any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:46:5:
   | 
45 |     consume(stop(), firstUnreachedArgument(), secondUnreachedArgument())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
46 |     println("unreachable after first Nothing argument")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:51:30:
   | 
51 |     consume(value(), stop(), firstUnreachedArgument())
   |                      ~~~~~~  ^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   |                      |
   |                      any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:52:5:
   | 
51 |     consume(value(), stop(), firstUnreachedArgument())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
52 |     println("unreachable after middle Nothing argument")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:58:5:
   | 
57 |     consume(value(), value(), stop())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
58 |     println("unreachable after last Nothing argument")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:63:41:
   | 
63 |     consume(value(), throw Exception(), firstUnreachedArgument())
   |                      ~~~~~~~~~~~~~~~~~  ^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   |                      |
   |                      any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:64:5:
   | 
63 |     consume(value(), throw Exception(), firstUnreachedArgument())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
64 |     println("unreachable after throw argument")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:69:20:
   | 
69 |     stop().consume(value())
   |     ~~~~~~         ^^^^^^^ unreachable expression
   |     |
   |     any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:70:5:
   | 
69 |     stop().consume(value())
   |     ~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
70 |     println("unreachable after Nothing receiver")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:75:12:
   | 
75 |     stop()(value())
   |     ~~~~~~ ^^^^^^^ unreachable expression
   |     |
   |     any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:76:5:
   | 
75 |     stop()(value())
   |     ~~~~~~~~~~~~~~~ any code following this expression is unreachable
76 |     println("unreachable after Nothing callee")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> nothing_argument_evaluation.cj:82:5:
   | 
81 |     consumeNamed(third: stop(), first: value(), second: value())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
82 |     println("unreachable after declaration-order named call")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

15 warnings generated, 15 warnings printed.
*/
