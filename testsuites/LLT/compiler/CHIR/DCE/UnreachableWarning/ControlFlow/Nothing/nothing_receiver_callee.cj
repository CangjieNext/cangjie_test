// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify Nothing receiver and Nothing callee diagnostics retain their source locations.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

extend Nothing {
    func consume(value: Int64) { }
}
func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }

func receiver(): Int64 {
    stop().consume(next())
    println("unreachable after Nothing receiver")
    0
}

func callee(): Int64 {
    stop()(next())
    println("unreachable after Nothing callee")
    0
}

main() { receiver(); callee() }

/* SCAN-IN
warning: unreachable expression
  ==> nothing_receiver_callee.cj:17:20:
   | 
17 |     stop().consume(next())
   |     ~~~~~~         ^^^^^^ unreachable expression
   |     |
   |     any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_receiver_callee.cj:18:5:
   | 
17 |     stop().consume(next())
   |     ~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
18 |     println("unreachable after Nothing receiver")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_receiver_callee.cj:23:12:
   | 
23 |     stop()(next())
   |     ~~~~~~ ^^^^^^ unreachable expression
   |     |
   |     any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_receiver_callee.cj:24:5:
   | 
23 |     stop()(next())
   |     ~~~~~~~~~~~~~~ any code following this expression is unreachable
24 |     println("unreachable after Nothing callee")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
