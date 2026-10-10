// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: testDCEApply08.info
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args %output 2>&1 | compare testDCEApply08.info




func test() {
    println("func")
    {a: Int64 => ()}
}

main() {
    test()(return 0)
    return 0
}

/* SCAN
warning: unused variable:'a'
  ==> testDCEApply08.cj:17:6:
   | 
17 |     {a: Int64 => ()}
   |      ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable 'call'
  ==> testDCEApply08.cj:21:5:
   | 
21 |     test()(return 0)
   |     ^^^^^^ ~~~~~~~~ any code following this expression is unreachable
   |     |
   |     unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEApply08.cj:22:5:
   | 
21 |     test()(return 0)
   |     ~~~~~~~~~~~~~~~~ any code following this expression is unreachable
22 |     return 0
   |     ^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
