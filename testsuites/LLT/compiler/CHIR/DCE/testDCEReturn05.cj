// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

public func test() {
    for (i in 1..10) {
        -return
    }
    return
}

main() {
    test()
    0
}

/* SCAN
warning: unused variable:'i'
  ==> testDCEReturn05.cj:11:10:
   | 
11 |     for (i in 1..10) {
   |          ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable 'operator'
  ==> testDCEReturn05.cj:12:9:
   | 
12 |         -return
   |         ^~~~~~~ any code following this expression is unreachable
   |         |
   |         unreachable 'operator'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
