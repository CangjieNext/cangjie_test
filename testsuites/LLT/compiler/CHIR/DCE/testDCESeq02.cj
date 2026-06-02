// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

main() {
    return 0;
    let x = 0;
    return 0;
    let b = 2;
    0
}

/* SCAN
warning: unreachable expression
  ==> testDCESeq02.cj:12:5:
   | 
11 |     return 0;
   |     ~~~~~~~~ any code following this expression is unreachable
12 |     let x = 0;
   |     ^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
