// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

var num = 0

func test(a: Int64, b: Nothing, c: Int64) {
    num = 1
}

func foo() {
    test(1, return num, 2)
    return 1
}

func goo() {
    try {
        test(1, throw Exception(), 2)
    } catch (_) {
        return num
    }
    return 1
}

main() {
    foo() + goo()
}

/* SCAN
warning: unused function:'test'
  ==> testDCENothing3.cj:12:1:
   | 
12 |   func test(a: Int64, b: Nothing, c: Int64) {
   |  _^
13 | |     num = 1
14 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'a'
  ==> testDCENothing3.cj:12:11:
   | 
12 | func test(a: Int64, b: Nothing, c: Int64) {
   |           ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable function 
  ==> testDCENothing3.cj:12:21:
   | 
12 | func test(a: Int64, b: Nothing, c: Int64) {
   |                     ^ function with parameter of nothing type will never be executed
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'c'
  ==> testDCENothing3.cj:12:33:
   | 
12 | func test(a: Int64, b: Nothing, c: Int64) {
   |                                 ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testDCENothing3.cj:17:10:
   | 
17 |     test(1, return num, 2)
   |          ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCENothing3.cj:17:25:
   | 
17 |     test(1, return num, 2)
   |             ~~~~~~~~~~  ^ unreachable expression
   |             |
   |             any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCENothing3.cj:23:9:
   | 
23 |         test(1, throw Exception(), 2)
   |         ^^^^    ~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
   |         |
   |         unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testDCENothing3.cj:23:14:
   | 
23 |         test(1, throw Exception(), 2)
   |              ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

8 warnings generated, 8 warnings printed.
*/
