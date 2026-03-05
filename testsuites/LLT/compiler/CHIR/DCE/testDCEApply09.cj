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
  ==> testDCEApply09.cj:10:1:
   | 
10 |   func test(a: Int64) {
   |  _^
11 | |     println("func")
   | | ...
13 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'a'
  ==> testDCEApply09.cj:10:11:
   | 
10 | func test(a: Int64) {
   |           ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'a'
  ==> testDCEApply09.cj:12:6:
   | 
12 |     {a: Int64 => ()}
   |      ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable 'call'
  ==> testDCEApply09.cj:16:5:
   | 
16 |     test(return 0)(return 1)
   |     ^^^^ ~~~~~~~~ any code following this expression is unreachable
   |     |
   |     unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/
