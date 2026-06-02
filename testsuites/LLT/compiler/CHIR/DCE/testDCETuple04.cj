// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC-0: %run %run_opt %output %run_args

func a() {
    (return 1, 3, 2)
    0
}

func b() {
    (return 1, 3, return 2)
    0
}

func c() {
    (1, 3, return 2)
    0
}

main() {
    a()
    b()
    c()
    return 0
}

/* SCAN
warning: unreachable expression
  ==> testDCETuple04.cj:11:16:
   | 
11 |     (return 1, 3, 2)
   |      ~~~~~~~~  ^ unreachable expression
   |      |
   |      any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCETuple04.cj:16:16:
   | 
16 |     (return 1, 3, return 2)
   |      ~~~~~~~~  ^ unreachable expression
   |      |
   |      any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCETuple04.cj:21:5:
   | 
21 |     (1, 3, return 2)
   |     ^^^^^^^^^^^^^^^^any code following this expression is unreachable
   |     |
   |     unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testDCETuple04.cj:21:6:
   | 
21 |     (1, 3, return 2)
   |      ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testDCETuple04.cj:21:9:
   | 
21 |     (1, 3, return 2)
   |         ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

5 warnings generated, 5 warnings printed.
*/
