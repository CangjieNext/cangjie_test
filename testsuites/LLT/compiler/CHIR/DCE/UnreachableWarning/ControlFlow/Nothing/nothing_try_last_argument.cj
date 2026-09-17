// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: a last Nothing argument in a try block reports only its following continuation.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }
func consume(a: Int64, b: Nothing) {}

func test() {
    try {
        consume(next(), stop())
        println("unreachable after try call")
    } catch (_) {
        ()
    }
}

main() { test() }

/* SCAN-IN
warning: unreachable function 
  ==> nothing_try_last_argument.cj:12:24:
   | 
12 | func consume(a: Int64, b: Nothing) {}
   |                        ^ function with parameter of nothing type will never be executed
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable 'call'
  ==> nothing_try_last_argument.cj:16:9:
   | 
16 |         consume(next(), stop())
   |         ^^^^^^^         ~~~~~~ any code following this expression is unreachable
   |         |
   |         unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_try_last_argument.cj:17:9:
   | 
16 |         consume(next(), stop())
   |         ~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
17 |         println("unreachable after try call")
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
