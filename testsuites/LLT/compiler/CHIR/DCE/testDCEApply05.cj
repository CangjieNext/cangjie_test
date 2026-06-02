// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

func test1() {
    1..2 : (return 0)
    return 1
}

func test2() {
    1..=2 : (return 0)
    return 1
}

main() {
    return test1() + test2()
}

/* SCAN
warning: unused expression
  ==> testDCEApply05.cj:11:5:
   | 
11 |     1..2 : (return 0)
   |     ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEApply05.cj:11:5:
   | 
11 |     1..2 : (return 0)
   |     ^^^^^^^^^^^^^^^^^any code following this expression is unreachable
   |     |
   |     unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testDCEApply05.cj:11:8:
   | 
11 |     1..2 : (return 0)
   |        ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testDCEApply05.cj:16:5:
   | 
16 |     1..=2 : (return 0)
   |     ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEApply05.cj:16:5:
   | 
16 |     1..=2 : (return 0)
   |     ^^^^^^^^^^^^^^^^^^any code following this expression is unreachable
   |     |
   |     unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testDCEApply05.cj:16:9:
   | 
16 |     1..=2 : (return 0)
   |         ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

6 warnings generated, 6 warnings printed.
*/
