// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

main(): Int64 {
    let a = Option<Int64>.None ?? 0
    let b = Option<Int64>.Some(1) ?? 0
    return 0
}

/* SCAN
warning: unused variable:'a'
  ==> testDCEMatch02.cj:11:9:
   | 
11 |     let a = Option<Int64>.None ?? 0
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEMatch02.cj:11:13:
   | 
11 |     let a = Option<Int64>.None ?? 0
   |             ^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'b'
  ==> testDCEMatch02.cj:12:9:
   | 
12 |     let b = Option<Int64>.Some(1) ?? 0
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEMatch02.cj:12:38:
   | 
12 |     let b = Option<Int64>.Some(1) ?? 0
   |                                      ^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/
