// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

main() {
    var a = 0
    for (i in 0..10) {
        a = continue // a是不可达的表达式
        a = 1
    }
    return a
}

/* SCAN
warning: unused variable:'i'
  ==> testDCEAsg02.cj:12:10:
   | 
12 |     for (i in 0..10) {
   |          ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEAsg02.cj:13:9:
   | 
13 |         a = continue // a是不可达的表达式
   |         ^^^^^^^^^^^^ any code following this expression is unreachable
   |         |
   |         unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
