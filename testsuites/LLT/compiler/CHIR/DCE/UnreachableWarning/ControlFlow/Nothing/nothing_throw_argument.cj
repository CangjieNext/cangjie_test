// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a throwing argument and the following statement form separate unreachable regions.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func next(): Int64 { 1 }
func consume(first: Int64, second: Int64, third: Int64) { }

main() {
    consume(next(), throw Exception(), next())
    println("unreachable after throw argument")
}

/* SCAN-IN
warning: unreachable 'call'
  ==> nothing_throw_argument.cj:14:5:
   | 
14 |     consume(next(), throw Exception(), next())
   |     ^^^^^^^         ~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
   |     |
   |     unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_throw_argument.cj:14:40:
   | 
14 |     consume(next(), throw Exception(), next())
   |                     ~~~~~~~~~~~~~~~~~  ^^^^^^ unreachable expression
   |                     |
   |                     any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_throw_argument.cj:15:5:
   | 
14 |     consume(next(), throw Exception(), next())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
15 |     println("unreachable after throw argument")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
