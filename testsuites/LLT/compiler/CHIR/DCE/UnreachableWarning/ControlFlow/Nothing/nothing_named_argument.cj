// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify named arguments use declaration order when Nothing stops evaluation.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }
func consumeNamed(first!: Int64, second!: Int64, third!: Int64) { }

main() {
    consumeNamed(third: stop(), first: next(), second: next())
    println("unreachable after declaration-order named call")
}

/* SCAN-IN
warning: unreachable 'call'
  ==> nothing_named_argument.cj:15:5:
   | 
15 |     consumeNamed(third: stop(), first: next(), second: next())
   |     ^^^^^^^^^^^^        ~~~~~~ any code following this expression is unreachable
   |     |
   |     unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_named_argument.cj:16:5:
   | 
15 |     consumeNamed(third: stop(), first: next(), second: next())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
16 |     println("unreachable after declaration-order named call")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
