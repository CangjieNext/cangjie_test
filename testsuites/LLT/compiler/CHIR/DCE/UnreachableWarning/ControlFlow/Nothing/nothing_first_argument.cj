// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify arguments after the first Nothing argument are lowered into an unreachable continuation.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }
func consume(first: Int64, second: Int64, third: Int64) { }

func test(): Int64 {
    consume(stop(), next(), next())
    println("unreachable after first Nothing argument")
    0
}

main() { test() }

/* SCAN-IN
warning: unreachable 'call'
  ==> nothing_first_argument.cj:15:5:
   | 
15 |     consume(stop(), next(), next())
   |     ^^^^^^^ ~~~~~~ any code following this expression is unreachable
   |     |
   |     unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_first_argument.cj:15:21:
   | 
15 |     consume(stop(), next(), next())
   |             ~~~~~~  ^^^^^^ unreachable expression
   |             |
   |             any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_first_argument.cj:16:5:
   | 
15 |     consume(stop(), next(), next())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
16 |     println("unreachable after first Nothing argument")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
