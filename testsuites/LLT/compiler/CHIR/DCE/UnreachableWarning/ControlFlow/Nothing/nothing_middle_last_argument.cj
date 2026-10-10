// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify middle and last Nothing arguments preserve their distinct continuations.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }
func consume(first: Int64, second: Int64, third: Int64) { }

func middle(): Int64 {
    consume(next(), stop(), next())
    println("unreachable after middle Nothing argument")
    0
}

func last(): Int64 {
    consume(next(), next(), stop())
    println("unreachable after last Nothing argument")
    0
}

main() { middle(); last() }

/* SCAN-IN
warning: unreachable 'call'
  ==> nothing_middle_last_argument.cj:15:5:
   | 
15 |     consume(next(), stop(), next())
   |     ^^^^^^^         ~~~~~~ any code following this expression is unreachable
   |     |
   |     unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_middle_last_argument.cj:15:29:
   | 
15 |     consume(next(), stop(), next())
   |                     ~~~~~~  ^^^^^^ unreachable expression
   |                     |
   |                     any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_middle_last_argument.cj:16:5:
   | 
15 |     consume(next(), stop(), next())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
16 |     println("unreachable after middle Nothing argument")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable 'call'
  ==> nothing_middle_last_argument.cj:21:5:
   | 
21 |     consume(next(), next(), stop())
   |     ^^^^^^^                 ~~~~~~ any code following this expression is unreachable
   |     |
   |     unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_middle_last_argument.cj:22:5:
   | 
21 |     consume(next(), next(), stop())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
22 |     println("unreachable after last Nothing argument")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
