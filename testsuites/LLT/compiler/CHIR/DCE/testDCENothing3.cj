// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
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
  ==> testDCENothing3.cj:18:1:
   | 
18 |   func test(a: Int64, b: Nothing, c: Int64) {
   |  _^
19 | |     num = 1
20 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'a'
  ==> testDCENothing3.cj:18:11:
   | 
18 | func test(a: Int64, b: Nothing, c: Int64) {
   |           ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable function 
  ==> testDCENothing3.cj:18:21:
   | 
18 | func test(a: Int64, b: Nothing, c: Int64) {
   |                     ^ function with parameter of nothing type will never be executed
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'c'
  ==> testDCENothing3.cj:18:33:
   | 
18 | func test(a: Int64, b: Nothing, c: Int64) {
   |                                 ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable 'call'
  ==> testDCENothing3.cj:23:5:
   | 
23 |     test(1, return num, 2)
   |     ^^^^    ~~~~~~~~~~ any code following this expression is unreachable
   |     |
   |     unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testDCENothing3.cj:23:10:
   | 
23 |     test(1, return num, 2)
   |          ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCENothing3.cj:23:25:
   | 
23 |     test(1, return num, 2)
   |             ~~~~~~~~~~  ^ unreachable expression
   |             |
   |             any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCENothing3.cj:24:5:
   | 
23 |     test(1, return num, 2)
   |     ~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
24 |     return 1
   |     ^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable 'call'
  ==> testDCENothing3.cj:29:9:
   | 
29 |         test(1, throw Exception(), 2)
   |         ^^^^    ~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
   |         |
   |         unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testDCENothing3.cj:29:14:
   | 
29 |         test(1, throw Exception(), 2)
   |              ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCENothing3.cj:33:5:
   | 
28 |       try {
   |  _____~
29 | |         test(1, throw Exception(), 2)
   | | ...
32 | |     }
   | |_____~ any code following this expression is unreachable
33 |       return 1
   |       ^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

11 warnings generated, 11 warnings printed.
*/
