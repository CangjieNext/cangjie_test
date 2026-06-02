// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args %output 

main(): Int64 {
    -(return 0)
    return 1
}

/* SCAN
warning: unreachable 'operator'
  ==> testDCEUnary01.cj:11:5:
   | 
11 |     -(return 0)
   |     ^ ~~~~~~~~ any code following this expression is unreachable
   |     |
   |     unreachable 'operator'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
