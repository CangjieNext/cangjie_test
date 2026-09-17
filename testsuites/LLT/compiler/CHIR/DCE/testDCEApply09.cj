// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args 





func test(a: Int64) {
    println("func")
    {a: Int64 => ()}
}

main() {
    test(return 0)(return 1)
    return 0
}

/* SCAN
warning: unused function:'test'
  ==> testDCEApply09.cj:14:1:
   | 
14 |   func test(a: Int64) {
   |  _^
15 | |     println("func")
   | | ...
17 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'a'
  ==> testDCEApply09.cj:14:11:
   | 
14 | func test(a: Int64) {
   |           ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'a'
  ==> testDCEApply09.cj:16:6:
   | 
16 |     {a: Int64 => ()}
   |      ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable 'call'
  ==> testDCEApply09.cj:20:5:
   | 
20 |     test(return 0)(return 1)
   |     ^^^^ ~~~~~~~~ any code following this expression is unreachable
   |     |
   |     unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEApply09.cj:20:20:
   | 
20 |     test(return 0)(return 1)
   |     ~~~~~~~~~~~~~~ ^^^^^^^^ unreachable expression
   |     |
   |     any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEApply09.cj:21:5:
   | 
20 |     test(return 0)(return 1)
   |     ~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
21 |     return 0
   |     ^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

6 warnings generated, 6 warnings printed.
*/
