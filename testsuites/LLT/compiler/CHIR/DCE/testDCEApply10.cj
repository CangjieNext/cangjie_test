// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC-0: %run %run_opt %output %run_args

private func foo(a: Int64, b: Int64, c: Int64) {
    return a + b + c
}

private func a() {
    foo(return 1, 3, 2)
    0
}

private func b() {
    foo(return 1, 3, return 2)
    0
}

private func c() {
    foo(1, 3, return 2)
    0
}

main() {
    a()
    b()
    c()
    return 0
}

/* SCAN
warning: unused function:'foo'
  ==> testDCEApply10.cj:10:1:
   | 
10 |   private func foo(a: Int64, b: Int64, c: Int64) {
   |  _^
11 | |     return a + b + c
12 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEApply10.cj:15:19:
   | 
15 |     foo(return 1, 3, 2)
   |         ~~~~~~~~  ^ unreachable expression
   |         |
   |         any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEApply10.cj:20:19:
   | 
20 |     foo(return 1, 3, return 2)
   |         ~~~~~~~~  ^ unreachable expression
   |         |
   |         any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable 'call'
  ==> testDCEApply10.cj:25:5:
   | 
25 |     foo(1, 3, return 2)
   |     ^^^       ~~~~~~~~ any code following this expression is unreachable
   |     |
   |     unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testDCEApply10.cj:25:9:
   | 
25 |     foo(1, 3, return 2)
   |         ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testDCEApply10.cj:25:12:
   | 
25 |     foo(1, 3, return 2)
   |            ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

6 warnings generated, 6 warnings printed.
*/
