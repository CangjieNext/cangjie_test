// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args %output 

func test(): Int64 {
    (return 1) * (return 1)
}

main(): Int64 {
    return test() - 1
}

/* SCAN
warning: unreachable expression
  ==> testDCEBinary04.cj:11:19:
   | 
11 |     (return 1) * (return 1)
   |      ~~~~~~~~     ^^^^^^^^ unreachable expression
   |      |
   |      any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
